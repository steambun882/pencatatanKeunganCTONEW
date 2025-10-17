// GENERATED CODE - MANUALLY WRITTEN BECAUSE BUILD TOOLS ARE UNAVAILABLE.
// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type

part of 'app_database.dart';

class AccountEntity extends DataClass implements Insertable<AccountEntity> {
  const AccountEntity({
    required this.id,
    this.remoteId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.name,
    required this.type,
    required this.balance,
    required this.currency,
  });

  final int id;
  final String? remoteId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String name;
  final String type;
  final int balance;
  final String currency;

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String?>(remoteId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime?>(deletedAt);
    }
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['balance'] = Variable<int>(balance);
    map['currency'] = Variable<String>(currency);
    return map;
  }

  AccountCompanion toCompanion(bool nullToAbsent) {
    return AccountCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent ? const Value.absent() : Value(remoteId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      name: Value(name),
      type: Value(type),
      balance: Value(balance),
      currency: Value(currency),
    );
  }

  factory AccountEntity.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountEntity(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      balance: serializer.fromJson<int>(json['balance']),
      currency: serializer.fromJson<String>(json['currency']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'balance': serializer.toJson<int>(balance),
      'currency': serializer.toJson<String>(currency),
    };
  }

  AccountEntity copyWith({
    int? id,
    Value<String?> remoteId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? name,
    String? type,
    int? balance,
    String? currency,
  }) {
    return AccountEntity(
      id: id ?? this.id,
      remoteId: remoteId.present ? remoteId.value : this.remoteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      name: name ?? this.name,
      type: type ?? this.type,
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
    );
  }

  @override
  int get hashCode => Object.hash(
        id,
        remoteId,
        createdAt,
        updatedAt,
        deletedAt,
        name,
        type,
        balance,
        currency,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AccountEntity &&
            other.id == id &&
            other.remoteId == remoteId &&
            other.createdAt == createdAt &&
            other.updatedAt == updatedAt &&
            other.deletedAt == deletedAt &&
            other.name == name &&
            other.type == type &&
            other.balance == balance &&
            other.currency == currency);
  }

  @override
  String toString() {
    return (StringBuffer('AccountEntity(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('balance: $balance, ')
          ..write('currency: $currency')
          ..write(')'))
        .toString();
  }
}

class AccountCompanion extends UpdateCompanion<AccountEntity> {
  const AccountCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.balance = const Value.absent(),
    this.currency = const Value.absent(),
  });

  AccountCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String name,
    required String type,
    required int balance,
    required String currency,
  })  : name = Value(name),
        type = Value(type),
        balance = Value(balance),
        currency = Value(currency);

  static Insertable<AccountEntity> custom({
    Expression<int>? id,
    Expression<String?>? remoteId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime?>? deletedAt,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? balance,
    Expression<String>? currency,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (balance != null) 'balance': balance,
      if (currency != null) 'currency': currency,
    });
  }

  AccountCompanion copyWith({
    Value<int>? id,
    Value<String?>? remoteId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? name,
    Value<String>? type,
    Value<int>? balance,
    Value<String>? currency,
  }) {
    return AccountCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      name: name ?? this.name,
      type: type ?? this.type,
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String?>(remoteId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime?>(deletedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (balance.present) {
      map['balance'] = Variable<int>(balance.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('balance: $balance, ')
          ..write('currency: $currency')
          ..write(')'))
        .toString();
  }
}

class $AccountsTable extends Accounts with TableInfo<$AccountsTable, AccountEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $AccountsTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = VerificationMeta('id');
  static const VerificationMeta _remoteIdMeta = VerificationMeta('remoteId');
  static const VerificationMeta _createdAtMeta = VerificationMeta('createdAt');
  static const VerificationMeta _updatedAtMeta = VerificationMeta('updatedAt');
  static const VerificationMeta _deletedAtMeta = VerificationMeta('deletedAt');
  static const VerificationMeta _nameMeta = VerificationMeta('name');
  static const VerificationMeta _typeMeta = VerificationMeta('type');
  static const VerificationMeta _balanceMeta = VerificationMeta('balance');
  static const VerificationMeta _currencyMeta = VerificationMeta('currency');

  @override
  List<GeneratedColumn<dynamic>> get $columns => [
        id,
        remoteId,
        createdAt,
        updatedAt,
        deletedAt,
        name,
        type,
        balance,
        currency,
      ];

  @override
  String get aliasedName => _alias ?? 'accounts';

  @override
  String get actualTableName => 'accounts';

  @override
  VerificationContext validateIntegrity(Insertable<AccountEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
          _remoteIdMeta, remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updatedAtMeta, updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
          _deletedAtMeta, deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('name')) {
      context.handle(_nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(_typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('balance')) {
      context.handle(
          _balanceMeta, balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta));
    } else if (isInserting) {
      context.missing(_balanceMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
          _currencyMeta, currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  AccountEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountEntity(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      balance: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}balance'])!,
      currency: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }

  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );

  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<int> balance = GeneratedColumn<int>(
    'balance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<String?> remoteId = GeneratedColumn<String?>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );

  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
    clientDefault: () => DateTime.now(),
  );

  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
    clientDefault: () => DateTime.now(),
  );

  late final GeneratedColumn<DateTime?> deletedAt = GeneratedColumn<DateTime?>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
}


class CategoryEntity extends DataClass implements Insertable<CategoryEntity> {
  const CategoryEntity({
    required this.id,
    this.remoteId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.name,
    required this.colorHex,
    this.parentId,
  });

  final int id;
  final String? remoteId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String name;
  final String colorHex;
  final int? parentId;

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String?>(remoteId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime?>(deletedAt);
    }
    map['name'] = Variable<String>(name);
    map['color_hex'] = Variable<String>(colorHex);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int?>(parentId);
    }
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent ? const Value.absent() : Value(remoteId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      name: Value(name),
      colorHex: Value(colorHex),
      parentId: parentId == null && nullToAbsent ? const Value.absent() : Value(parentId),
    );
  }

  factory CategoryEntity.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryEntity(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      name: serializer.fromJson<String>(json['name']),
      colorHex: serializer.fromJson<String>(json['colorHex']),
      parentId: serializer.fromJson<int?>(json['parentId']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'name': serializer.toJson<String>(name),
      'colorHex': serializer.toJson<String>(colorHex),
      'parentId': serializer.toJson<int?>(parentId),
    };
  }

  CategoryEntity copyWith({
    int? id,
    Value<String?> remoteId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? name,
    String? colorHex,
    Value<int?> parentId = const Value.absent(),
  }) {
    return CategoryEntity(
      id: id ?? this.id,
      remoteId: remoteId.present ? remoteId.value : this.remoteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      name: name ?? this.name,
      colorHex: colorHex ?? this.colorHex,
      parentId: parentId.present ? parentId.value : this.parentId,
    );
  }

  @override
  int get hashCode => Object.hash(
        id,
        remoteId,
        createdAt,
        updatedAt,
        deletedAt,
        name,
        colorHex,
        parentId,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CategoryEntity &&
            other.id == id &&
            other.remoteId == remoteId &&
            other.createdAt == createdAt &&
            other.updatedAt == updatedAt &&
            other.deletedAt == deletedAt &&
            other.name == name &&
            other.colorHex == colorHex &&
            other.parentId == parentId);
  }

  @override
  String toString() {
    return (StringBuffer('CategoryEntity(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex, ')
          ..write('parentId: $parentId')
          ..write(')'))
        .toString();
  }
}

class CategoryCompanion extends UpdateCompanion<CategoryEntity> {
  const CategoryCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.parentId = const Value.absent(),
  });

  CategoryCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String name,
    required String colorHex,
    Value<int?> parentId = const Value.absent(),
  })  : name = Value(name),
        colorHex = Value(colorHex),
        parentId = parentId;

  static Insertable<CategoryEntity> custom({
    Expression<int>? id,
    Expression<String?>? remoteId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime?>? deletedAt,
    Expression<String>? name,
    Expression<String>? colorHex,
    Expression<int?>? parentId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (name != null) 'name': name,
      if (colorHex != null) 'color_hex': colorHex,
      if (parentId != null) 'parent_id': parentId,
    });
  }

  CategoryCompanion copyWith({
    Value<int>? id,
    Value<String?>? remoteId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? name,
    Value<String>? colorHex,
    Value<int?>? parentId,
  }) {
    return CategoryCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      name: name ?? this.name,
      colorHex: colorHex ?? this.colorHex,
      parentId: parentId ?? this.parentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String?>(remoteId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime?>(deletedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int?>(parentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex, ')
          ..write('parentId: $parentId')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, CategoryEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $CategoriesTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = VerificationMeta('id');
  static const VerificationMeta _remoteIdMeta = VerificationMeta('remoteId');
  static const VerificationMeta _createdAtMeta = VerificationMeta('createdAt');
  static const VerificationMeta _updatedAtMeta = VerificationMeta('updatedAt');
  static const VerificationMeta _deletedAtMeta = VerificationMeta('deletedAt');
  static const VerificationMeta _nameMeta = VerificationMeta('name');
  static const VerificationMeta _colorHexMeta = VerificationMeta('colorHex');
  static const VerificationMeta _parentIdMeta = VerificationMeta('parentId');

  @override
  List<GeneratedColumn<dynamic>> get $columns => [
        id,
        remoteId,
        createdAt,
        updatedAt,
        deletedAt,
        name,
        colorHex,
        parentId,
      ];

  @override
  String get aliasedName => _alias ?? 'categories';

  @override
  String get actualTableName => 'categories';

  @override
  VerificationContext validateIntegrity(Insertable<CategoryEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
          _remoteIdMeta, remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updatedAtMeta, updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
          _deletedAtMeta, deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('name')) {
      context.handle(_nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color_hex')) {
      context.handle(
          _colorHexMeta, colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta));
    } else if (isInserting) {
      context.missing(_colorHexMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
          _parentIdMeta, parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  CategoryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryEntity(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      colorHex: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}color_hex'])!,
      parentId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id']),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }

  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );

  late final GeneratedColumn<String?> remoteId = GeneratedColumn<String?>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );

  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
    clientDefault: () => DateTime.now(),
  );

  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
    clientDefault: () => DateTime.now(),
  );

  late final GeneratedColumn<DateTime?> deletedAt = GeneratedColumn<DateTime?>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );

  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
    'color_hex',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    additionalChecks: GeneratedColumn.checkTextLength('color_hex',
        minTextLength: 4, maxTextLength: 9),
  );

  late final GeneratedColumn<int?> parentId = GeneratedColumn<int?>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints:
        GeneratedColumn.constraintIsAlways('REFERENCES categories (id) ON DELETE SET NULL'),
  );
}


class TransactionEntity extends DataClass implements Insertable<TransactionEntity> {
  const TransactionEntity({
    required this.id,
    this.remoteId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.accountId,
    this.categoryId,
    required this.amount,
    required this.occurredAt,
    this.note,
  });

  final int id;
  final String? remoteId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int accountId;
  final int? categoryId;
  final int amount;
  final DateTime occurredAt;
  final String? note;

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String?>(remoteId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime?>(deletedAt);
    }
    map['account_id'] = Variable<int>(accountId);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int?>(categoryId);
    }
    map['amount'] = Variable<int>(amount);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String?>(note);
    }
    return map;
  }

  TransactionCompanion toCompanion(bool nullToAbsent) {
    return TransactionCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent ? const Value.absent() : Value(remoteId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      accountId: Value(accountId),
      categoryId: categoryId == null && nullToAbsent ? const Value.absent() : Value(categoryId),
      amount: Value(amount),
      occurredAt: Value(occurredAt),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory TransactionEntity.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionEntity(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      accountId: serializer.fromJson<int>(json['accountId']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
      amount: serializer.fromJson<int>(json['amount']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'accountId': serializer.toJson<int>(accountId),
      'categoryId': serializer.toJson<int?>(categoryId),
      'amount': serializer.toJson<int>(amount),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'note': serializer.toJson<String?>(note),
    };
  }

  TransactionEntity copyWith({
    int? id,
    Value<String?> remoteId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? accountId,
    Value<int?> categoryId = const Value.absent(),
    int? amount,
    DateTime? occurredAt,
    Value<String?> note = const Value.absent(),
  }) {
    return TransactionEntity(
      id: id ?? this.id,
      remoteId: remoteId.present ? remoteId.value : this.remoteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId.present ? categoryId.value : this.categoryId,
      amount: amount ?? this.amount,
      occurredAt: occurredAt ?? this.occurredAt,
      note: note.present ? note.value : this.note,
    );
  }

  @override
  int get hashCode => Object.hash(
        id,
        remoteId,
        createdAt,
        updatedAt,
        deletedAt,
        accountId,
        categoryId,
        amount,
        occurredAt,
        note,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TransactionEntity &&
            other.id == id &&
            other.remoteId == remoteId &&
            other.createdAt == createdAt &&
            other.updatedAt == updatedAt &&
            other.deletedAt == deletedAt &&
            other.accountId == accountId &&
            other.categoryId == categoryId &&
            other.amount == amount &&
            other.occurredAt == occurredAt &&
            other.note == note);
  }

  @override
  String toString() {
    return (StringBuffer('TransactionEntity(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('accountId: $accountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('amount: $amount, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class TransactionCompanion extends UpdateCompanion<TransactionEntity> {
  const TransactionCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.accountId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.amount = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.note = const Value.absent(),
  });

  TransactionCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required int accountId,
    Value<int?> categoryId = const Value.absent(),
    required int amount,
    required DateTime occurredAt,
    Value<String?> note = const Value.absent(),
  })  : accountId = Value(accountId),
        categoryId = categoryId,
        amount = Value(amount),
        occurredAt = Value(occurredAt),
        note = note;

  static Insertable<TransactionEntity> custom({
    Expression<int>? id,
    Expression<String?>? remoteId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime?>? deletedAt,
    Expression<int>? accountId,
    Expression<int?>? categoryId,
    Expression<int>? amount,
    Expression<DateTime>? occurredAt,
    Expression<String?>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (accountId != null) 'account_id': accountId,
      if (categoryId != null) 'category_id': categoryId,
      if (amount != null) 'amount': amount,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (note != null) 'note': note,
    });
  }

  TransactionCompanion copyWith({
    Value<int>? id,
    Value<String?>? remoteId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? accountId,
    Value<int?>? categoryId,
    Value<int>? amount,
    Value<DateTime>? occurredAt,
    Value<String?>? note,
  }) {
    return TransactionCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      occurredAt: occurredAt ?? this.occurredAt,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String?>(remoteId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime?>(deletedAt.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int?>(categoryId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String?>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('accountId: $accountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('amount: $amount, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, TransactionEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $TransactionsTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = VerificationMeta('id');
  static const VerificationMeta _remoteIdMeta = VerificationMeta('remoteId');
  static const VerificationMeta _createdAtMeta = VerificationMeta('createdAt');
  static const VerificationMeta _updatedAtMeta = VerificationMeta('updatedAt');
  static const VerificationMeta _deletedAtMeta = VerificationMeta('deletedAt');
  static const VerificationMeta _accountIdMeta = VerificationMeta('accountId');
  static const VerificationMeta _categoryIdMeta = VerificationMeta('categoryId');
  static const VerificationMeta _amountMeta = VerificationMeta('amount');
  static const VerificationMeta _occurredAtMeta = VerificationMeta('occurredAt');
  static const VerificationMeta _noteMeta = VerificationMeta('note');

  @override
  List<GeneratedColumn<dynamic>> get $columns => [
        id,
        remoteId,
        createdAt,
        updatedAt,
        deletedAt,
        accountId,
        categoryId,
        amount,
        occurredAt,
        note,
      ];

  @override
  String get aliasedName => _alias ?? 'transactions';

  @override
  String get actualTableName => 'transactions';

  @override
  VerificationContext validateIntegrity(Insertable<TransactionEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
          _remoteIdMeta, remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updatedAtMeta, updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
          _deletedAtMeta, deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('account_id')) {
      context.handle(
          _accountIdMeta, accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta, categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta, amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
          _occurredAtMeta, occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta));
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(_noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  TransactionEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionEntity(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      accountId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}account_id'])!,
      categoryId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
      amount: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      occurredAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}occurred_at'])!,
      note: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }

  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );

  late final GeneratedColumn<String?> remoteId = GeneratedColumn<String?>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );

  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
    clientDefault: () => DateTime.now(),
  );

  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
    clientDefault: () => DateTime.now(),
  );

  late final GeneratedColumn<DateTime?> deletedAt = GeneratedColumn<DateTime?>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );

  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints:
        GeneratedColumn.constraintIsAlways('REFERENCES accounts (id) ON DELETE CASCADE'),
  );

  late final GeneratedColumn<int?> categoryId = GeneratedColumn<int?>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints:
        GeneratedColumn.constraintIsAlways('REFERENCES categories (id) ON DELETE SET NULL'),
  );

  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<String?> note = GeneratedColumn<String?>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
}


class TransferEntity extends DataClass implements Insertable<TransferEntity> {
  const TransferEntity({
    required this.id,
    this.remoteId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.fromAccountId,
    required this.toAccountId,
    required this.amount,
    required this.occurredAt,
    this.memo,
  });

  final int id;
  final String? remoteId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int fromAccountId;
  final int toAccountId;
  final int amount;
  final DateTime occurredAt;
  final String? memo;

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String?>(remoteId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime?>(deletedAt);
    }
    map['from_account_id'] = Variable<int>(fromAccountId);
    map['to_account_id'] = Variable<int>(toAccountId);
    map['amount'] = Variable<int>(amount);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String?>(memo);
    }
    return map;
  }

  TransferCompanion toCompanion(bool nullToAbsent) {
    return TransferCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent ? const Value.absent() : Value(remoteId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      fromAccountId: Value(fromAccountId),
      toAccountId: Value(toAccountId),
      amount: Value(amount),
      occurredAt: Value(occurredAt),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
    );
  }

  factory TransferEntity.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransferEntity(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      fromAccountId: serializer.fromJson<int>(json['fromAccountId']),
      toAccountId: serializer.fromJson<int>(json['toAccountId']),
      amount: serializer.fromJson<int>(json['amount']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      memo: serializer.fromJson<String?>(json['memo']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'fromAccountId': serializer.toJson<int>(fromAccountId),
      'toAccountId': serializer.toJson<int>(toAccountId),
      'amount': serializer.toJson<int>(amount),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'memo': serializer.toJson<String?>(memo),
    };
  }

  TransferEntity copyWith({
    int? id,
    Value<String?> remoteId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? fromAccountId,
    int? toAccountId,
    int? amount,
    DateTime? occurredAt,
    Value<String?> memo = const Value.absent(),
  }) {
    return TransferEntity(
      id: id ?? this.id,
      remoteId: remoteId.present ? remoteId.value : this.remoteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      fromAccountId: fromAccountId ?? this.fromAccountId,
      toAccountId: toAccountId ?? this.toAccountId,
      amount: amount ?? this.amount,
      occurredAt: occurredAt ?? this.occurredAt,
      memo: memo.present ? memo.value : this.memo,
    );
  }

  @override
  int get hashCode => Object.hash(
        id,
        remoteId,
        createdAt,
        updatedAt,
        deletedAt,
        fromAccountId,
        toAccountId,
        amount,
        occurredAt,
        memo,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TransferEntity &&
            other.id == id &&
            other.remoteId == remoteId &&
            other.createdAt == createdAt &&
            other.updatedAt == updatedAt &&
            other.deletedAt == deletedAt &&
            other.fromAccountId == fromAccountId &&
            other.toAccountId == toAccountId &&
            other.amount == amount &&
            other.occurredAt == occurredAt &&
            other.memo == memo);
  }

  @override
  String toString() {
    return (StringBuffer('TransferEntity(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('fromAccountId: $fromAccountId, ')
          ..write('toAccountId: $toAccountId, ')
          ..write('amount: $amount, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('memo: $memo')
          ..write(')'))
        .toString();
  }
}

class TransferCompanion extends UpdateCompanion<TransferEntity> {
  const TransferCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.fromAccountId = const Value.absent(),
    this.toAccountId = const Value.absent(),
    this.amount = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.memo = const Value.absent(),
  });

  TransferCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required int fromAccountId,
    required int toAccountId,
    required int amount,
    required DateTime occurredAt,
    Value<String?> memo = const Value.absent(),
  })  : fromAccountId = Value(fromAccountId),
        toAccountId = Value(toAccountId),
        amount = Value(amount),
        occurredAt = Value(occurredAt),
        memo = memo;

  static Insertable<TransferEntity> custom({
    Expression<int>? id,
    Expression<String?>? remoteId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime?>? deletedAt,
    Expression<int>? fromAccountId,
    Expression<int>? toAccountId,
    Expression<int>? amount,
    Expression<DateTime>? occurredAt,
    Expression<String?>? memo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (fromAccountId != null) 'from_account_id': fromAccountId,
      if (toAccountId != null) 'to_account_id': toAccountId,
      if (amount != null) 'amount': amount,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (memo != null) 'memo': memo,
    });
  }

  TransferCompanion copyWith({
    Value<int>? id,
    Value<String?>? remoteId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? fromAccountId,
    Value<int>? toAccountId,
    Value<int>? amount,
    Value<DateTime>? occurredAt,
    Value<String?>? memo,
  }) {
    return TransferCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      fromAccountId: fromAccountId ?? this.fromAccountId,
      toAccountId: toAccountId ?? this.toAccountId,
      amount: amount ?? this.amount,
      occurredAt: occurredAt ?? this.occurredAt,
      memo: memo ?? this.memo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String?>(remoteId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime?>(deletedAt.value);
    }
    if (fromAccountId.present) {
      map['from_account_id'] = Variable<int>(fromAccountId.value);
    }
    if (toAccountId.present) {
      map['to_account_id'] = Variable<int>(toAccountId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String?>(memo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransferCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('fromAccountId: $fromAccountId, ')
          ..write('toAccountId: $toAccountId, ')
          ..write('amount: $amount, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('memo: $memo')
          ..write(')'))
        .toString();
  }
}

class $TransfersTable extends Transfers with TableInfo<$TransfersTable, TransferEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $TransfersTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = VerificationMeta('id');
  static const VerificationMeta _remoteIdMeta = VerificationMeta('remoteId');
  static const VerificationMeta _createdAtMeta = VerificationMeta('createdAt');
  static const VerificationMeta _updatedAtMeta = VerificationMeta('updatedAt');
  static const VerificationMeta _deletedAtMeta = VerificationMeta('deletedAt');
  static const VerificationMeta _fromAccountIdMeta = VerificationMeta('fromAccountId');
  static const VerificationMeta _toAccountIdMeta = VerificationMeta('toAccountId');
  static const VerificationMeta _amountMeta = VerificationMeta('amount');
  static const VerificationMeta _occurredAtMeta = VerificationMeta('occurredAt');
  static const VerificationMeta _memoMeta = VerificationMeta('memo');

  @override
  List<GeneratedColumn<dynamic>> get $columns => [
        id,
        remoteId,
        createdAt,
        updatedAt,
        deletedAt,
        fromAccountId,
        toAccountId,
        amount,
        occurredAt,
        memo,
      ];

  @override
  String get aliasedName => _alias ?? 'transfers';

  @override
  String get actualTableName => 'transfers';

  @override
  VerificationContext validateIntegrity(Insertable<TransferEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
          _remoteIdMeta, remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updatedAtMeta, updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
          _deletedAtMeta, deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('from_account_id')) {
      context.handle(
          _fromAccountIdMeta,
          fromAccountId.isAcceptableOrUnknown(data['from_account_id']!, _fromAccountIdMeta));
    } else if (isInserting) {
      context.missing(_fromAccountIdMeta);
    }
    if (data.containsKey('to_account_id')) {
      context.handle(
          _toAccountIdMeta,
          toAccountId.isAcceptableOrUnknown(data['to_account_id']!, _toAccountIdMeta));
    } else if (isInserting) {
      context.missing(_toAccountIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta, amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
          _occurredAtMeta, occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta));
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(_memoMeta, memo.isAcceptableOrUnknown(data['memo']!, _memoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  TransferEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransferEntity(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      fromAccountId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}from_account_id'])!,
      toAccountId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}to_account_id'])!,
      amount: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      occurredAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}occurred_at'])!,
      memo: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}memo']),
    );
  }

  @override
  $TransfersTable createAlias(String alias) {
    return $TransfersTable(attachedDatabase, alias);
  }

  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );

  late final GeneratedColumn<String?> remoteId = GeneratedColumn<String?>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );

  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
    clientDefault: () => DateTime.now(),
  );

  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
    clientDefault: () => DateTime.now(),
  );

  late final GeneratedColumn<DateTime?> deletedAt = GeneratedColumn<DateTime?>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );

  late final GeneratedColumn<int> fromAccountId = GeneratedColumn<int>(
    'from_account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints:
        GeneratedColumn.constraintIsAlways('REFERENCES accounts (id) ON DELETE CASCADE'),
  );

  late final GeneratedColumn<int> toAccountId = GeneratedColumn<int>(
    'to_account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints:
        GeneratedColumn.constraintIsAlways('REFERENCES accounts (id) ON DELETE CASCADE'),
  );

  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<String?> memo = GeneratedColumn<String?>(
    'memo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
}


class AttachmentEntity extends DataClass implements Insertable<AttachmentEntity> {
  const AttachmentEntity({
    required this.id,
    this.remoteId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.transactionId,
    required this.fileName,
    required this.filePath,
    required this.mimeType,
    required this.sizeBytes,
  });

  final int id;
  final String? remoteId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int transactionId;
  final String fileName;
  final String filePath;
  final String mimeType;
  final int sizeBytes;

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String?>(remoteId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime?>(deletedAt);
    }
    map['transaction_id'] = Variable<int>(transactionId);
    map['file_name'] = Variable<String>(fileName);
    map['file_path'] = Variable<String>(filePath);
    map['mime_type'] = Variable<String>(mimeType);
    map['size_bytes'] = Variable<int>(sizeBytes);
    return map;
  }

  AttachmentCompanion toCompanion(bool nullToAbsent) {
    return AttachmentCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent ? const Value.absent() : Value(remoteId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      transactionId: Value(transactionId),
      fileName: Value(fileName),
      filePath: Value(filePath),
      mimeType: Value(mimeType),
      sizeBytes: Value(sizeBytes),
    );
  }

  factory AttachmentEntity.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttachmentEntity(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      transactionId: serializer.fromJson<int>(json['transactionId']),
      fileName: serializer.fromJson<String>(json['fileName']),
      filePath: serializer.fromJson<String>(json['filePath']),
      mimeType: serializer.fromJson<String>(json['mimeType']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'transactionId': serializer.toJson<int>(transactionId),
      'fileName': serializer.toJson<String>(fileName),
      'filePath': serializer.toJson<String>(filePath),
      'mimeType': serializer.toJson<String>(mimeType),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
    };
  }

  AttachmentEntity copyWith({
    int? id,
    Value<String?> remoteId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? transactionId,
    String? fileName,
    String? filePath,
    String? mimeType,
    int? sizeBytes,
  }) {
    return AttachmentEntity(
      id: id ?? this.id,
      remoteId: remoteId.present ? remoteId.value : this.remoteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      transactionId: transactionId ?? this.transactionId,
      fileName: fileName ?? this.fileName,
      filePath: filePath ?? this.filePath,
      mimeType: mimeType ?? this.mimeType,
      sizeBytes: sizeBytes ?? this.sizeBytes,
    );
  }

  @override
  int get hashCode => Object.hash(
        id,
        remoteId,
        createdAt,
        updatedAt,
        deletedAt,
        transactionId,
        fileName,
        filePath,
        mimeType,
        sizeBytes,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AttachmentEntity &&
            other.id == id &&
            other.remoteId == remoteId &&
            other.createdAt == createdAt &&
            other.updatedAt == updatedAt &&
            other.deletedAt == deletedAt &&
            other.transactionId == transactionId &&
            other.fileName == fileName &&
            other.filePath == filePath &&
            other.mimeType == mimeType &&
            other.sizeBytes == sizeBytes);
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentEntity(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('transactionId: $transactionId, ')
          ..write('fileName: $fileName, ')
          ..write('filePath: $filePath, ')
          ..write('mimeType: $mimeType, ')
          ..write('sizeBytes: $sizeBytes')
          ..write(')'))
        .toString();
  }
}

class AttachmentCompanion extends UpdateCompanion<AttachmentEntity> {
  const AttachmentCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.fileName = const Value.absent(),
    this.filePath = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.sizeBytes = const Value.absent(),
  });

  AttachmentCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required int transactionId,
    required String fileName,
    required String filePath,
    required String mimeType,
    required int sizeBytes,
  })  : transactionId = Value(transactionId),
        fileName = Value(fileName),
        filePath = Value(filePath),
        mimeType = Value(mimeType),
        sizeBytes = Value(sizeBytes);

  static Insertable<AttachmentEntity> custom({
    Expression<int>? id,
    Expression<String?>? remoteId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime?>? deletedAt,
    Expression<int>? transactionId,
    Expression<String>? fileName,
    Expression<String>? filePath,
    Expression<String>? mimeType,
    Expression<int>? sizeBytes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (transactionId != null) 'transaction_id': transactionId,
      if (fileName != null) 'file_name': fileName,
      if (filePath != null) 'file_path': filePath,
      if (mimeType != null) 'mime_type': mimeType,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
    });
  }

  AttachmentCompanion copyWith({
    Value<int>? id,
    Value<String?>? remoteId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? transactionId,
    Value<String>? fileName,
    Value<String>? filePath,
    Value<String>? mimeType,
    Value<int>? sizeBytes,
  }) {
    return AttachmentCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      transactionId: transactionId ?? this.transactionId,
      fileName: fileName ?? this.fileName,
      filePath: filePath ?? this.filePath,
      mimeType: mimeType ?? this.mimeType,
      sizeBytes: sizeBytes ?? this.sizeBytes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String?>(remoteId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime?>(deletedAt.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('transactionId: $transactionId, ')
          ..write('fileName: $fileName, ')
          ..write('filePath: $filePath, ')
          ..write('mimeType: $mimeType, ')
          ..write('sizeBytes: $sizeBytes')
          ..write(')'))
        .toString();
  }
}

class $AttachmentsTable extends Attachments
    with TableInfo<$AttachmentsTable, AttachmentEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $AttachmentsTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = VerificationMeta('id');
  static const VerificationMeta _remoteIdMeta = VerificationMeta('remoteId');
  static const VerificationMeta _createdAtMeta = VerificationMeta('createdAt');
  static const VerificationMeta _updatedAtMeta = VerificationMeta('updatedAt');
  static const VerificationMeta _deletedAtMeta = VerificationMeta('deletedAt');
  static const VerificationMeta _transactionIdMeta = VerificationMeta('transactionId');
  static const VerificationMeta _fileNameMeta = VerificationMeta('fileName');
  static const VerificationMeta _filePathMeta = VerificationMeta('filePath');
  static const VerificationMeta _mimeTypeMeta = VerificationMeta('mimeType');
  static const VerificationMeta _sizeBytesMeta = VerificationMeta('sizeBytes');

  @override
  List<GeneratedColumn<dynamic>> get $columns => [
        id,
        remoteId,
        createdAt,
        updatedAt,
        deletedAt,
        transactionId,
        fileName,
        filePath,
        mimeType,
        sizeBytes,
      ];

  @override
  String get aliasedName => _alias ?? 'attachments';

  @override
  String get actualTableName => 'attachments';

  @override
  VerificationContext validateIntegrity(Insertable<AttachmentEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
          _remoteIdMeta, remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updatedAtMeta, updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
          _deletedAtMeta, deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(data['transaction_id']!, _transactionIdMeta));
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('file_name')) {
      context.handle(
          _fileNameMeta, fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta));
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
          _filePathMeta, filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('mime_type')) {
      context.handle(
          _mimeTypeMeta, mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta));
    } else if (isInserting) {
      context.missing(_mimeTypeMeta);
    }
    if (data.containsKey('size_bytes')) {
      context.handle(
          _sizeBytesMeta, sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta));
    } else if (isInserting) {
      context.missing(_sizeBytesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  AttachmentEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttachmentEntity(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      transactionId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}transaction_id'])!,
      fileName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}file_name'])!,
      filePath: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      mimeType: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}mime_type'])!,
      sizeBytes: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}size_bytes'])!,
    );
  }

  @override
  $AttachmentsTable createAlias(String alias) {
    return $AttachmentsTable(attachedDatabase, alias);
  }

  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );

  late final GeneratedColumn<String?> remoteId = GeneratedColumn<String?>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );

  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
    clientDefault: () => DateTime.now(),
  );

  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
    clientDefault: () => DateTime.now(),
  );

  late final GeneratedColumn<DateTime?> deletedAt = GeneratedColumn<DateTime?>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );

  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
    'transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints:
        GeneratedColumn.constraintIsAlways('REFERENCES transactions (id) ON DELETE CASCADE'),
  );

  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
    'size_bytes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
}


class SyncMetadataEntity extends DataClass implements Insertable<SyncMetadataEntity> {
  const SyncMetadataEntity({
    required this.id,
    this.remoteId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.entityType,
    this.lastSyncedAt,
    this.lastSyncCursor,
  });

  final int id;
  final String? remoteId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String entityType;
  final DateTime? lastSyncedAt;
  final String? lastSyncCursor;

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String?>(remoteId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime?>(deletedAt);
    }
    map['entity_type'] = Variable<String>(entityType);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime?>(lastSyncedAt);
    }
    if (!nullToAbsent || lastSyncCursor != null) {
      map['last_sync_cursor'] = Variable<String?>(lastSyncCursor);
    }
    return map;
  }

  SyncMetadataCompanion toCompanion(bool nullToAbsent) {
    return SyncMetadataCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent ? const Value.absent() : Value(remoteId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      entityType: Value(entityType),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent ? const Value.absent() : Value(lastSyncedAt),
      lastSyncCursor: lastSyncCursor == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncCursor),
    );
  }

  factory SyncMetadataEntity.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetadataEntity(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      entityType: serializer.fromJson<String>(json['entityType']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      lastSyncCursor: serializer.fromJson<String?>(json['lastSyncCursor']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'entityType': serializer.toJson<String>(entityType),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'lastSyncCursor': serializer.toJson<String?>(lastSyncCursor),
    };
  }

  SyncMetadataEntity copyWith({
    int? id,
    Value<String?> remoteId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? entityType,
    Value<DateTime?> lastSyncedAt = const Value.absent(),
    Value<String?> lastSyncCursor = const Value.absent(),
  }) {
    return SyncMetadataEntity(
      id: id ?? this.id,
      remoteId: remoteId.present ? remoteId.value : this.remoteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      entityType: entityType ?? this.entityType,
      lastSyncedAt: lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
      lastSyncCursor: lastSyncCursor.present ? lastSyncCursor.value : this.lastSyncCursor,
    );
  }

  @override
  int get hashCode => Object.hash(
        id,
        remoteId,
        createdAt,
        updatedAt,
        deletedAt,
        entityType,
        lastSyncedAt,
        lastSyncCursor,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SyncMetadataEntity &&
            other.id == id &&
            other.remoteId == remoteId &&
            other.createdAt == createdAt &&
            other.updatedAt == updatedAt &&
            other.deletedAt == deletedAt &&
            other.entityType == entityType &&
            other.lastSyncedAt == lastSyncedAt &&
            other.lastSyncCursor == lastSyncCursor);
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataEntity(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('entityType: $entityType, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('lastSyncCursor: $lastSyncCursor')
          ..write(')'))
        .toString();
  }
}

class SyncMetadataCompanion extends UpdateCompanion<SyncMetadataEntity> {
  const SyncMetadataCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.entityType = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.lastSyncCursor = const Value.absent(),
  });

  SyncMetadataCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String entityType,
    Value<DateTime?> lastSyncedAt = const Value.absent(),
    Value<String?> lastSyncCursor = const Value.absent(),
  })  : entityType = Value(entityType),
        lastSyncedAt = lastSyncedAt,
        lastSyncCursor = lastSyncCursor;

  static Insertable<SyncMetadataEntity> custom({
    Expression<int>? id,
    Expression<String?>? remoteId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime?>? deletedAt,
    Expression<String>? entityType,
    Expression<DateTime?>? lastSyncedAt,
    Expression<String?>? lastSyncCursor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (entityType != null) 'entity_type': entityType,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (lastSyncCursor != null) 'last_sync_cursor': lastSyncCursor,
    });
  }

  SyncMetadataCompanion copyWith({
    Value<int>? id,
    Value<String?>? remoteId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? entityType,
    Value<DateTime?>? lastSyncedAt,
    Value<String?>? lastSyncCursor,
  }) {
    return SyncMetadataCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      entityType: entityType ?? this.entityType,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      lastSyncCursor: lastSyncCursor ?? this.lastSyncCursor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String?>(remoteId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime?>(deletedAt.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime?>(lastSyncedAt.value);
    }
    if (lastSyncCursor.present) {
      map['last_sync_cursor'] = Variable<String?>(lastSyncCursor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('entityType: $entityType, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('lastSyncCursor: $lastSyncCursor')
          ..write(')'))
        .toString();
  }
}

class $SyncMetadataEntriesTable extends SyncMetadataEntries
    with TableInfo<$SyncMetadataEntriesTable, SyncMetadataEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $SyncMetadataEntriesTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = VerificationMeta('id');
  static const VerificationMeta _remoteIdMeta = VerificationMeta('remoteId');
  static const VerificationMeta _createdAtMeta = VerificationMeta('createdAt');
  static const VerificationMeta _updatedAtMeta = VerificationMeta('updatedAt');
  static const VerificationMeta _deletedAtMeta = VerificationMeta('deletedAt');
  static const VerificationMeta _entityTypeMeta = VerificationMeta('entityType');
  static const VerificationMeta _lastSyncedAtMeta = VerificationMeta('lastSyncedAt');
  static const VerificationMeta _lastSyncCursorMeta = VerificationMeta('lastSyncCursor');

  @override
  List<GeneratedColumn<dynamic>> get $columns => [
        id,
        remoteId,
        createdAt,
        updatedAt,
        deletedAt,
        entityType,
        lastSyncedAt,
        lastSyncCursor,
      ];

  @override
  String get aliasedName => _alias ?? 'sync_metadata_entries';

  @override
  String get actualTableName => 'sync_metadata_entries';

  @override
  VerificationContext validateIntegrity(Insertable<SyncMetadataEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
          _remoteIdMeta, remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updatedAtMeta, updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
          _deletedAtMeta, deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta, entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('last_sync_cursor')) {
      context.handle(
          _lastSyncCursorMeta,
          lastSyncCursor.isAcceptableOrUnknown(data['last_sync_cursor']!, _lastSyncCursorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {entityType},
      ];

  @override
  SyncMetadataEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetadataEntity(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      entityType: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      lastSyncedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      lastSyncCursor: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}last_sync_cursor']),
    );
  }

  @override
  $SyncMetadataEntriesTable createAlias(String alias) {
    return $SyncMetadataEntriesTable(attachedDatabase, alias);
  }

  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: 'PRIMARY KEY AUTOINCREMENT',
  );

  late final GeneratedColumn<String?> remoteId = GeneratedColumn<String?>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );

  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
    clientDefault: () => DateTime.now(),
  );

  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
    clientDefault: () => DateTime.now(),
  );

  late final GeneratedColumn<DateTime?> deletedAt = GeneratedColumn<DateTime?>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );

  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<DateTime?> lastSyncedAt = GeneratedColumn<DateTime?>(
    'last_synced_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );

  late final GeneratedColumn<String?> lastSyncCursor = GeneratedColumn<String?>(
    'last_sync_cursor',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
}


abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);

  late final $AccountsTable accounts = $AccountsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $TransfersTable transfers = $TransfersTable(this);
  late final $AttachmentsTable attachments = $AttachmentsTable(this);
  late final $SyncMetadataEntriesTable syncMetadataEntries =
      $SyncMetadataEntriesTable(this);

  late final AccountDao accountDao = AccountDao(this as AppDatabase);
  late final CategoryDao categoryDao = CategoryDao(this as AppDatabase);
  late final TransactionDao transactionDao = TransactionDao(this as AppDatabase);
  late final TransferDao transferDao = TransferDao(this as AppDatabase);
  late final AttachmentDao attachmentDao = AttachmentDao(this as AppDatabase);
  late final SyncMetadataDao syncMetadataDao = SyncMetadataDao(this as AppDatabase);

  @override
  List<TableInfo<Table, Object?>> get allTables => [
        accounts,
        categories,
        transactions,
        transfers,
        attachments,
        syncMetadataEntries,
      ];

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        accounts,
        categories,
        transactions,
        transfers,
        attachments,
        syncMetadataEntries,
      ];
}

mixin _$AccountDaoMixin on DatabaseAccessor<AppDatabase> {
  $AccountsTable get accounts => attachedDatabase.accounts;
}

mixin _$CategoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategoriesTable get categories => attachedDatabase.categories;
}

mixin _$TransactionDaoMixin on DatabaseAccessor<AppDatabase> {
  $TransactionsTable get transactions => attachedDatabase.transactions;
}

mixin _$TransferDaoMixin on DatabaseAccessor<AppDatabase> {
  $TransfersTable get transfers => attachedDatabase.transfers;
}

mixin _$AttachmentDaoMixin on DatabaseAccessor<AppDatabase> {
  $AttachmentsTable get attachments => attachedDatabase.attachments;
}

mixin _$SyncMetadataDaoMixin on DatabaseAccessor<AppDatabase> {
  $SyncMetadataEntriesTable get syncMetadataEntries =>
      attachedDatabase.syncMetadataEntries;
}

