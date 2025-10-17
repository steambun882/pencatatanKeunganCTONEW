import 'package:drift/drift.dart';

import '../local/app_database.dart';

class CategoryRepository {
  CategoryRepository(AppDatabase database) : _dao = CategoryDao(database);

  final CategoryDao _dao;

  Future<int> createCategory({
    String? remoteId,
    required String name,
    required String colorHex,
    int? parentId,
  }) {
    return _dao.create(
      CategoryCompanion.insert(
        remoteId: Value(remoteId),
        name: name,
        colorHex: colorHex,
        parentId: Value(parentId),
      ),
    );
  }

  Future<void> updateCategory(
    int id, {
    String? remoteId,
    String? name,
    String? colorHex,
    int? parentId,
  }) {
    return _dao.updateCategory(
      id,
      CategoryCompanion(
        remoteId: remoteId != null ? Value(remoteId) : const Value.absent(),
        name: name != null ? Value(name) : const Value.absent(),
        colorHex: colorHex != null ? Value(colorHex) : const Value.absent(),
        parentId: parentId != null ? Value(parentId) : const Value.absent(),
      ),
    );
  }

  Future<void> softDelete(int id) => _dao.softDelete(id);

  Future<List<CategoryEntity>> getActiveCategories() => _dao.getActive();

  Stream<List<CategoryEntity>> watchActiveCategories() => _dao.watchActive();

  Future<List<CategoryEntity>> getChangedCategories(DateTime since) => _dao.getChangesSince(since);
}
