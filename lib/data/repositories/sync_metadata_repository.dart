import 'package:drift/drift.dart';

import '../local/app_database.dart';

class SyncMetadataRepository {
  SyncMetadataRepository(AppDatabase database) : _dao = SyncMetadataDao(database);

  final SyncMetadataDao _dao;

  Future<SyncMetadataEntity?> getMetadata(String entityType) =>
      _dao.findByEntityType(entityType);

  Future<int> upsertMetadata({
    required String entityType,
    DateTime? lastSyncedAt,
    String? lastSyncCursor,
    String? remoteId,
  }) {
    return _dao.upsert(
      SyncMetadataCompanion(
        entityType: Value(entityType),
        lastSyncedAt: Value(lastSyncedAt),
        lastSyncCursor: Value(lastSyncCursor),
        remoteId: remoteId != null ? Value(remoteId) : const Value<String?>.absent(),
      ),
    );
  }

  Future<void> touch(
    String entityType, {
    DateTime? syncedAt,
    String? cursor,
  }) =>
      _dao.touch(entityType, syncedAt: syncedAt, cursor: cursor);

  Future<List<SyncMetadataEntity>> getAllMetadata() => _dao.getAll();
}
