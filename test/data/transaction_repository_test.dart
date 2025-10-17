import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pencatatan_keuangan/data/local/app_database.dart';
import 'package:pencatatan_keuangan/data/repositories/category_repository_impl.dart';
import 'package:pencatatan_keuangan/data/repositories/transaction_repository_impl.dart';
import 'package:pencatatan_keuangan/domain/domain.dart';

void main() {
  group('Drift data layer', () {
    late AppDatabase database;
    late DriftCategoryRepository categoryRepository;
    late DriftTransactionRepository transactionRepository;

    setUp(() {
      database = AppDatabase.forTesting(NativeDatabase.memory());
      categoryRepository = DriftCategoryRepository(database);
      transactionRepository = DriftTransactionRepository(database);
    });

    tearDown(() async {
      await database.close();
    });

    test('prepopulates the default uncategorized category', () async {
      final categories = await categoryRepository.fetchAll();

      expect(
        categories.any(
          (category) => category.id == TransactionCategory.uncategorizedId,
        ),
        isTrue,
      );
    });

    test('persists and retrieves transactions', () async {
      final createdAt = DateTime.utc(2024, 10, 1, 7, 30);
      final transaction = MoneyTransaction(
        id: 'txn_test',
        title: 'Kopi pagi',
        amount: 25000,
        type: TransactionType.expense,
        occurredOn: createdAt,
        categoryId: TransactionCategory.uncategorizedId,
        note: 'Flat white',
        createdAt: createdAt,
        updatedAt: createdAt,
      );

      final stream = transactionRepository.watchAll();
      final expectation = expectLater(
        stream,
        emitsThrough(
          isA<List<MoneyTransaction>>().having(
            (items) => items.any((element) => element.id == transaction.id),
            'contains saved transaction',
            isTrue,
          ),
        ),
      );

      await transactionRepository.save(transaction);

      final stored = await transactionRepository.findById(transaction.id);
      expect(stored, isNotNull);
      expect(stored!.title, equals('Kopi pagi'));
      expect(stored.categoryId, equals(TransactionCategory.uncategorizedId));
      expect(
        stored.updatedAt.isAfter(createdAt) ||
            stored.updatedAt.isAtSameMomentAs(createdAt),
        isTrue,
      );

      await transactionRepository.delete(transaction.id);
      final afterDelete = await transactionRepository.findById(transaction.id);
      expect(afterDelete, isNull);

      await expectation;
    });
  });
}
