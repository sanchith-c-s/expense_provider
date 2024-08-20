import 'package:expanse_provider/constants/icons.dart';
import 'package:flutter/material.dart';

class ExpenseCategory {
  final String title;
  int entries = 0;
  double totalAmount = 0.0;
  final IconData icon;

  ExpenseCategory({
    required this.title,
    required this.entries,
    required this.totalAmount,
    required this.icon,
  });

  Map<String, dynamic> toMap() => {
        'title': title,
        'entries': entries,
        'totalAmount': totalAmount.toString()
      };

  factory ExpenseCategory.fromString(Map<String, dynamic> value) =>
      ExpenseCategory(
          title: value['title'],
          entries: value['entries'],
          totalAmount: double.parse(value['totalAmount']),
          icon: icons[value['title']]!);
}
