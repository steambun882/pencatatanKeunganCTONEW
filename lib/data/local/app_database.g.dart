part of 'app_database.dart';

class TransactionCategoryRow extends DataClass
    implements Insertable<TransactionCategoryRow> {
  const TransactionCategoryRow({
    required this.id,
    required this.name,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
  });


  final String id;
  final String name;
  final int color;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  Map<String, Expression<Object?>> toColumns(bool nullToAbsent) {
    final map = <String, Expression<Object?>>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<int>(color);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TransactionCategoriesCompanion toCompanion(bool nullToAbsent) {
    return TransactionCategoriesCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TransactionCategoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionCategoryRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<int>(json['color']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<int>(color),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TransactionCategoryRow copyWith({
    String? id,
    String? name,
    int? color,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TransactionCategoryRow(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionCategoryRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, createdAt, updatedAt);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TransactionCategoryRow &&
            other.id == id &&
            other.name == name &&
            other.color == color &&
            other.createdAt == createdAt &&
            other.updatedAt == updatedAt);
  }
}

class TransactionCategoriesCompanion
    extends UpdateCompanion<TransactionCategoryRow> {
  const TransactionCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });

  TransactionCategoriesCompanion.insert({
    required String id,
    required String name,
    required int color,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  })  : id = Value(id),
        name = Value(name),
        color = Value(color),
        createdAt = createdAt ?? const Value.absent(),
        updatedAt = updatedAt ?? const Value.absent();

  static Insertable<TransactionCategoryRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? color,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TransactionCategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? color,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return TransactionCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression<Object?>> toColumns(bool nullToAbsent) {
    final map = <String, Expression<Object?>>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TransactionCategoriesTable extends TransactionCategories
    with TableInfo<$TransactionCategoriesTable, TransactionCategoryRow> {
  $TransactionCategoriesTable(this.attachedDatabase, [this._alias]);

  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  @override
  String get aliasedName => _alias ?? 'transaction_categories';

  @override
  String get actualTableName => 'transaction_categories';

  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionCategoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(
        const VerificationMeta('id'),
        attachedDatabase.typeMapping
            .read(DriftSqlType.string, data['id']),
      );
    } else if (isInserting) {
      context.missing(const VerificationMeta('id'));
    }
    if (data.containsKey('name')) {
      context.handle(
        const VerificationMeta('name'),
        attachedDatabase.typeMapping
            .read(DriftSqlType.string, data['name']),
      );
    } else if (isInserting) {
      context.missing(const VerificationMeta('name'));
    }
    if (data.containsKey('color')) {
      context.handle(
        const VerificationMeta('color'),
        attachedDatabase.typeMapping
            .read(DriftSqlType.int, data['color']),
      );
    } else if (isInserting) {
      context.missing(const VerificationMeta('color'));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        const VerificationMeta('createdAt'),
        attachedDatabase.typeMapping
            .read(DriftSqlType.dateTime, data['created_at']),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        const VerificationMeta('updatedAt'),
        attachedDatabase.typeMapping
            .read(DriftSqlType.dateTime, data['updated_at']),
      );
    }
    return context;
  }

  @override
  List<GeneratedColumn<Object?>> get $columns => [
        id,
        name,
        color,
        createdAt,
        updatedAt,
      ];

  @override
  Set<GeneratedColumn<Object?>> get $primaryKey => {id};

  @override
  TransactionCategoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionCategoryRow(
      id: attachedDatabase.typeMapping.read<String>(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read<String>(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      color: attachedDatabase.typeMapping.read<int>(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      )!,
      createdAt: attachedDatabase.typeMapping.read<DateTime>(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read<DateTime>(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<int> color = GeneratedColumn<int>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );

  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );

  @override
  $TransactionCategoriesTable createAlias(String alias) {
    return $TransactionCategoriesTable(attachedDatabase, alias);
  }
}

class TransactionRow extends DataClass implements Insertable<TransactionRow> {
  const TransactionRow({
    required this.id,
    required this.title,
    required this.amount,
    required this.kind,
    this.categoryId,
    required this.occurredOn,
    this.note,
    required this.createdAt,
    required this.updatedAt,
  });


  final String id;
  final String title;
  final int amount;
  final int kind;
  final String? categoryId;
  final DateTime occurredOn;
  final String? note;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  Map<String, Expression<Object?>> toColumns(bool nullToAbsent) {
    final map = <String, Expression<Object?>>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['amount'] = Variable<int>(amount);
    map['kind'] = Variable<int>(kind);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String?>(categoryId);
    }
    map['occurred_on'] = Variable<DateTime>(occurredOn);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String?>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      title: Value(title),
      amount: Value(amount),
      kind: Value(kind),
      categoryId:
          categoryId == null && nullToAbsent ? const Value.absent() : Value(categoryId),
      occurredOn: Value(occurredOn),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TransactionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      amount: serializer.fromJson<int>(json['amount']),
      kind: serializer.fromJson<int>(json['kind']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      occurredOn: serializer.fromJson<DateTime>(json['occurredOn']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'amount': serializer.toJson<int>(amount),
      'kind': serializer.toJson<int>(kind),
      'categoryId': serializer.toJson<String?>(categoryId),
      'occurredOn': serializer.toJson<DateTime>(occurredOn),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TransactionRow copyWith({
    String? id,
    String? title,
    int? amount,
    int? kind,
    Value<String?>? categoryId,
    DateTime? occurredOn,
    Value<String?>? note,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TransactionRow(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      kind: kind ?? this.kind,
      categoryId: categoryId != null
          ? categoryId.present
              ? categoryId.value
              : this.categoryId
          : this.categoryId,
      occurredOn: occurredOn ?? this.occurredOn,
      note: note != null
          ? note.present
              ? note.value
              : this.note
          : this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('kind: $kind, ')
          ..write('categoryId: $categoryId, ')
          ..write('occurredOn: $occurredOn, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, amount, kind, categoryId, occurredOn,
      note, createdAt, updatedAt);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TransactionRow &&
            other.id == id &&
            other.title == title &&
            other.amount == amount &&
            other.kind == kind &&
            other.categoryId == categoryId &&
            other.occurredOn == occurredOn &&
            other.note == note &&
            other.createdAt == createdAt &&
            other.updatedAt == updatedAt);
  }
}

class TransactionsCompanion extends UpdateCompanion<TransactionRow> {
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.amount = const Value.absent(),
    this.kind = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.occurredOn = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });

  TransactionsCompanion.insert({
    required String id,
    required String title,
    required int amount,
    required int kind,
    Value<String?>? categoryId,
    required DateTime occurredOn,
    Value<String?>? note,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  })  : id = Value(id),
        title = Value(title),
        amount = Value(amount),
        kind = Value(kind),
        categoryId = categoryId ?? const Value.absent(),
        occurredOn = Value(occurredOn),
        note = note ?? const Value.absent(),
        createdAt = createdAt ?? const Value.absent(),
        updatedAt = updatedAt ?? const Value.absent();

  static Insertable<TransactionRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? amount,
    Expression<int>? kind,
    Expression<String?>? categoryId,
    Expression<DateTime>? occurredOn,
    Expression<String?>? note,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (amount != null) 'amount': amount,
      if (kind != null) 'kind': kind,
      if (categoryId != null) 'category_id': categoryId,
      if (occurredOn != null) 'occurred_on': occurredOn,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TransactionsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<int>? amount,
    Value<int>? kind,
    Value<String?>? categoryId,
    Value<DateTime>? occurredOn,
    Value<String?>? note,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return TransactionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      kind: kind ?? this.kind,
      categoryId: categoryId ?? this.categoryId,
      occurredOn: occurredOn ?? this.occurredOn,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression<Object?>> toColumns(bool nullToAbsent) {
    final map = <String, Expression<Object?>>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (kind.present) {
      map['kind'] = Variable<int>(kind.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String?>(categoryId.value);
    }
    if (occurredOn.present) {
      map['occurred_on'] = Variable<DateTime>(occurredOn.value);
    }
    if (note.present) {
      map['note'] = Variable<String?>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('kind: $kind, ')
          ..write('categoryId: $categoryId, ')
          ..write('occurredOn: $occurredOn, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, TransactionRow> {
  $TransactionsTable(this.attachedDatabase, [this._alias]);

  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  @override
  String get aliasedName => _alias ?? 'transactions';

  @override
  String get actualTableName => 'transactions';

  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(
        const VerificationMeta('id'),
        attachedDatabase.typeMapping
            .read(DriftSqlType.string, data['id']),
      );
    } else if (isInserting) {
      context.missing(const VerificationMeta('id'));
    }
    if (data.containsKey('title')) {
      context.handle(
        const VerificationMeta('title'),
        attachedDatabase.typeMapping
            .read(DriftSqlType.string, data['title']),
      );
    } else if (isInserting) {
      context.missing(const VerificationMeta('title'));
    }
    if (data.containsKey('amount')) {
      context.handle(
        const VerificationMeta('amount'),
        attachedDatabase.typeMapping
            .read(DriftSqlType.int, data['amount']),
      );
    } else if (isInserting) {
      context.missing(const VerificationMeta('amount'));
    }
    if (data.containsKey('kind')) {
      context.handle(
        const VerificationMeta('kind'),
        attachedDatabase.typeMapping
            .read(DriftSqlType.int, data['kind']),
      );
    } else if (isInserting) {
      context.missing(const VerificationMeta('kind'));
    }
    if (data.containsKey('category_id')) {
      context.handle(
        const VerificationMeta('categoryId'),
        attachedDatabase.typeMapping
            .readNullable(DriftSqlType.string, data['category_id']),
      );
    }
    if (data.containsKey('occurred_on')) {
      context.handle(
        const VerificationMeta('occurredOn'),
        attachedDatabase.typeMapping
            .read(DriftSqlType.dateTime, data['occurred_on']),
      );
    } else if (isInserting) {
      context.missing(const VerificationMeta('occurredOn'));
    }
    if (data.containsKey('note')) {
      context.handle(
        const VerificationMeta('note'),
        attachedDatabase.typeMapping
            .readNullable(DriftSqlType.string, data['note']),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        const VerificationMeta('createdAt'),
        attachedDatabase.typeMapping
            .read(DriftSqlType.dateTime, data['created_at']),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        const VerificationMeta('updatedAt'),
        attachedDatabase.typeMapping
            .read(DriftSqlType.dateTime, data['updated_at']),
      );
    }
    return context;
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<int> kind = GeneratedColumn<int>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );

  late final GeneratedColumn<String?> categoryId = GeneratedColumn<String?>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transaction_categories (id) ON DELETE SET NULL',
    ),
  );

  late final GeneratedColumn<DateTime> occurredOn = GeneratedColumn<DateTime>(
    'occurred_on',
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

  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );

  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );

  @override
  List<GeneratedColumn<Object?>> get $columns => [
        id,
        title,
        amount,
        kind,
        categoryId,
        occurredOn,
        note,
        createdAt,
        updatedAt,
      ];

  @override
  Set<GeneratedColumn<Object?>> get $primaryKey => {id};

  @override
  TransactionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionRow(
      id: attachedDatabase.typeMapping.read<String>(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read<String>(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      amount: attachedDatabase.typeMapping.read<int>(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      kind: attachedDatabase.typeMapping.read<int>(
        DriftSqlType.int,
        data['${effectivePrefix}kind'],
      )!,
      categoryId: attachedDatabase.typeMapping.readNullable<String>(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      ),
      occurredOn: attachedDatabase.typeMapping.read<DateTime>(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_on'],
      )!,
      note: attachedDatabase.typeMapping.readNullable<String>(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      createdAt: attachedDatabase.typeMapping.read<DateTime>(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read<DateTime>(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);

  late final $TransactionCategoriesTable transactionCategories =
      $TransactionCategoriesTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);

  @override
  List<TableInfo<Table, Object?>> get allTables =>
      [transactionCategories, transactions];

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [transactionCategories, transactions];

  late final TransactionsDao transactionsDao = TransactionsDao(this as AppDatabase);
  late final CategoriesDao categoriesDao = CategoriesDao(this as AppDatabase);
}

mixin _$TransactionsDaoMixin on DatabaseAccessor<AppDatabase> {
  $TransactionsTable get transactions => attachedDatabase.transactions;
  $TransactionCategoriesTable get transactionCategories =>
      attachedDatabase.transactionCategories;
}

mixin _$CategoriesDaoMixin on DatabaseAccessor<AppDatabase> {
  $TransactionCategoriesTable get transactionCategories =>
      attachedDatabase.transactionCategories;
}
