import 'package:drift/drift.dart';

import '../../domain/entities/transaction_category.dart';
import '../../domain/repositories/category_repository.dart';
import '../local/app_database.dart';

class DriftCategoryRepository implements CategoryRepository {
  DriftCategoryRepository(this._db);

  final AppDatabase _db;

  CategoriesDao get _dao => _db.categoriesDao;

  @override
  Stream<List<TransactionCategory>> watchAll() {
    return _dao.watchAll().map(
          (rows) => rows.map(_mapRow).toList(),
        );
  }

  @override
  Future<List<TransactionCategory>> fetchAll() async {
    final rows = await _dao.getAll();
    return rows.map(_mapRow).toList();
  }

  @override
  Future<TransactionCategory?> findById(String id) async {
    final row = await _dao.findById(id);
    if (row == null) {
      return null;
    }

    return _mapRow(row);
  }

  @override
  Future<void> save(TransactionCategory category) {
    final updated = category.copyWith(updatedAt: DateTime.now());
    final companion = TransactionCategoriesCompanion(
      id: Value(updated.id),
      name: Value(updated.name),
      color: Value(updated.color),
      createdAt: Value(updated.createdAt),
      updatedAt: Value(updated.updatedAt),
    );

    return _dao.upsert(companion);
  }

  @override
  Future<void> delete(String id) {
    if (id == TransactionCategory.uncategorizedId) {
      return Future.value();
    }

    return _dao.deleteById(id);
  }

  TransactionCategory _mapRow(TransactionCategoryRow row) {
    return TransactionCategory(
      id: row.id,
      name: row.name,
      color: row.color,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }
}
