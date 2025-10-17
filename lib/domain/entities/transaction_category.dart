import 'package:flutter/foundation.dart';

@immutable
class TransactionCategory {
  const TransactionCategory({
    required this.id,
    required this.name,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
  });

  static const uncategorizedId = 'uncategorized';

  final String id;
  final String name;
  final int color;
  final DateTime createdAt;
  final DateTime updatedAt;

  bool get isDefault => id == uncategorizedId;

  TransactionCategory copyWith({
    String? id,
    String? name,
    int? color,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TransactionCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  int get hashCode => Object.hash(id, name, color, createdAt, updatedAt);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TransactionCategory &&
            other.id == id &&
            other.name == name &&
            other.color == color &&
            other.createdAt == createdAt &&
            other.updatedAt == updatedAt;
  }

  @override
  String toString() {
    return 'TransactionCategory(id: $id, name: $name, color: $color)';
  }
}
