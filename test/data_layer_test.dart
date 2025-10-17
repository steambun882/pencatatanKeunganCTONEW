import 'package:flutter_test/flutter_test.dart';
import 'package:pencatatan_keuangan/data/data.dart';

void main() {
  late AppDatabase database;
  late AccountRepository accountRepository;
  late CategoryRepository categoryRepository;
  late TransactionRepository transactionRepository;
  late AttachmentRepository attachmentRepository;
  late TransferRepository transferRepository;
  late SyncMetadataRepository syncMetadataRepository;

  setUp(() {
    database = AppDatabase.inMemory();
    accountRepository = AccountRepository(database);
    categoryRepository = CategoryRepository(database);
    transactionRepository = TransactionRepository(database);
    attachmentRepository = AttachmentRepository(database);
    transferRepository = TransferRepository(database);
    syncMetadataRepository = SyncMetadataRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('account repository supports CRUD, soft deletes, and change tracking', () async {
    final accountId = await accountRepository.createAccount(
      name: 'Primary Wallet',
      type: 'cash',
      balance: 500000,
      currency: 'IDR',
    );

    var accounts = await accountRepository.getActiveAccounts();
    expect(accounts, hasLength(1));
    expect(accounts.single.name, 'Primary Wallet');
    expect(accounts.single.deletedAt, isNull);

    await accountRepository.updateAccount(
      accountId,
      name: 'Updated Wallet',
      remoteId: 'acc-remote-1',
    );

    final updatedAccount = await accountRepository.getAccount(accountId);
    expect(updatedAccount, isNotNull);
    expect(updatedAccount!.name, 'Updated Wallet');
    expect(updatedAccount.remoteId, 'acc-remote-1');

    final since = DateTime.now().subtract(const Duration(minutes: 5));
    final changes = await accountRepository.getChangedAccounts(since);
    expect(changes.map((e) => e.id), contains(accountId));

    await accountRepository.softDeleteAccount(accountId);

    accounts = await accountRepository.getActiveAccounts();
    expect(accounts, isEmpty);

    final postDeleteChanges =
        await accountRepository.getChangedAccounts(DateTime.fromMillisecondsSinceEpoch(0));
    expect(postDeleteChanges.single.deletedAt, isNotNull);
  });

  test('transactions integrate with attachments and track sync metadata', () async {
    final accountId = await accountRepository.createAccount(
      name: 'Debit Account',
      type: 'bank',
      balance: 1000000,
      currency: 'IDR',
    );
    final categoryId = await categoryRepository.createCategory(
      name: 'Groceries',
      colorHex: '#FF0000',
    );

    await categoryRepository.updateCategory(
      categoryId,
      colorHex: '#00FF00',
      remoteId: 'cat-remote-1',
    );

    var categories = await categoryRepository.getActiveCategories();
    expect(categories.single.remoteId, 'cat-remote-1');

    final now = DateTime.now();
    final transactionId = await transactionRepository.createTransaction(
      accountId: accountId,
      categoryId: categoryId,
      amount: -250000,
      occurredAt: now,
      note: 'Weekly shopping',
    );

    await transactionRepository.updateTransaction(
      transactionId,
      note: 'Weekly shopping - supermarket',
      remoteId: 'txn-remote-1',
    );

    final transaction = await transactionRepository.getTransaction(transactionId);
    expect(transaction, isNotNull);
    expect(transaction!.note, 'Weekly shopping - supermarket');
    expect(transaction.remoteId, 'txn-remote-1');

    final recentChanges = await transactionRepository.getChangedTransactions(now
        .subtract(const Duration(minutes: 1)));
    expect(recentChanges.map((e) => e.id), contains(transactionId));

    final attachmentId = await attachmentRepository.createAttachment(
      transactionId: transactionId,
      fileName: 'receipt.png',
      filePath: '/tmp/receipt.png',
      mimeType: 'image/png',
      sizeBytes: 2048,
    );

    var attachments =
        await attachmentRepository.getAttachmentsForTransaction(transactionId);
    expect(attachments, hasLength(1));

    await attachmentRepository.softDeleteAttachment(attachmentId);

    attachments = await attachmentRepository.getAttachmentsForTransaction(transactionId);
    expect(attachments, isEmpty);

    final attachmentChanges = await attachmentRepository
        .getChangedAttachments(DateTime.fromMillisecondsSinceEpoch(0));
    expect(attachmentChanges.single.deletedAt, isNotNull);

    await categoryRepository.softDelete(categoryId);
    categories = await categoryRepository.getActiveCategories();
    expect(categories, isEmpty);

    final categoryChanges = await categoryRepository
        .getChangedCategories(DateTime.fromMillisecondsSinceEpoch(0));
    expect(categoryChanges.single.deletedAt, isNotNull);

    final transferId = await transferRepository.createTransfer(
      fromAccountId: accountId,
      toAccountId: accountId,
      amount: 1000,
      occurredAt: now,
      memo: 'Self transfer',
    );

    await transferRepository.updateTransfer(
      transferId,
      memo: 'Updated memo',
      remoteId: 'transfer-remote-1',
    );

    final transferChanges = await transferRepository
        .getChangedTransfers(DateTime.fromMillisecondsSinceEpoch(0));
    expect(transferChanges.map((e) => e.id), contains(transferId));
    expect(transferChanges.first.memo, 'Updated memo');
  });

  test('sync metadata repository persists and updates sync state', () async {
    const entityType = 'accounts';

    var metadata = await syncMetadataRepository.getMetadata(entityType);
    expect(metadata, isNull);

    final firstSync = DateTime.now().subtract(const Duration(hours: 1));
    await syncMetadataRepository.touch(entityType, syncedAt: firstSync, cursor: 'cursor-1');

    metadata = await syncMetadataRepository.getMetadata(entityType);
    expect(metadata, isNotNull);
    expect(metadata!.lastSyncedAt, firstSync);
    expect(metadata.lastSyncCursor, 'cursor-1');

    await syncMetadataRepository.touch(entityType, cursor: 'cursor-2');

    metadata = await syncMetadataRepository.getMetadata(entityType);
    expect(metadata!.lastSyncCursor, 'cursor-2');
    expect(metadata.lastSyncedAt, isNotNull);

    final overrideSync = DateTime.now();
    await syncMetadataRepository.upsertMetadata(
      entityType: entityType,
      lastSyncedAt: overrideSync,
      lastSyncCursor: 'cursor-3',
      remoteId: 'metadata-remote-1',
    );

    metadata = await syncMetadataRepository.getMetadata(entityType);
    expect(metadata!.lastSyncedAt, overrideSync);
    expect(metadata.lastSyncCursor, 'cursor-3');
    expect(metadata.remoteId, 'metadata-remote-1');
  });
}
