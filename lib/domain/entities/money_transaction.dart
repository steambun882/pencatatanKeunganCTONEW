import 'package:flutter/foundation.dart';

import 'transaction_type.dart';

@immutable
class MoneyTransaction {
  const MoneyTransaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.type,
    required this.occurredOn,
    this.categoryId,
    this.note,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final int amount;
  final TransactionType type;
  final DateTime occurredOn;
  final String? categoryId;
  final String? note;
  final DateTime createdAt;
  final DateTime updatedAt;

  int get signedAmount => type.isIncome ? amount : -amount;

  MoneyTransaction copyWith({
    String? id,
    String? title,
    int? amount,
    TransactionType? type,
    DateTime? occurredOn,
    ValueGetter<String?>? categoryId,
    ValueGetter<String?>? note,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MoneyTransaction(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      occurredOn: occurredOn ?? this.occurredOn,
      categoryId: categoryId != null ? categoryId() : this.categoryId,
      note: note != null ? note() : this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  int get hashCode => Object.hash(
        id,
        title,
        amount,
        type,
        occurredOn,
        categoryId,
        note,
        createdAt,
        updatedAt,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is MoneyTransaction &&
            other.id == id &&
            other.title == title &&
            other.amount == amount &&
            other.type == type &&
            other.occurredOn == occurredOn &&
            other.categoryId == categoryId &&
            other.note == note &&
            other.createdAt == createdAt &&
            other.updatedAt == updatedAt;
  }

  @override
  String toString() {
    return 'MoneyTransaction(id: $id, title: $title, amount: $amount, type: $type)';
  }
}
