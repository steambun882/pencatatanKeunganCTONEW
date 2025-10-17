import 'package:drift/drift.dart';

import '../local/app_database.dart';

class AttachmentRepository {
  AttachmentRepository(AppDatabase database) : _dao = AttachmentDao(database);

  final AttachmentDao _dao;

  Future<int> createAttachment({
    String? remoteId,
    required int transactionId,
    required String fileName,
    required String filePath,
    required String mimeType,
    required int sizeBytes,
  }) {
    return _dao.create(
      AttachmentCompanion.insert(
        remoteId: Value(remoteId),
        transactionId: transactionId,
        fileName: fileName,
        filePath: filePath,
        mimeType: mimeType,
        sizeBytes: sizeBytes,
      ),
    );
  }

  Future<void> softDeleteAttachment(int id) => _dao.softDelete(id);

  Future<List<AttachmentEntity>> getAttachmentsForTransaction(int transactionId) =>
      _dao.getByTransaction(transactionId);

  Future<List<AttachmentEntity>> getChangedAttachments(DateTime since) =>
      _dao.getChangesSince(since);
}
