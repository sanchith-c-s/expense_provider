import 'package:expanse_provider/models/database_provider.dart';
import 'package:expanse_provider/widgets/expense_screen/expense_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (_, db, __) {
        var exList = db.expense;
        return ListView.builder(
            itemCount: exList.length,
            itemBuilder: (_, i) => ExpenseCard(exList[i]));
      },
    );
  }
}
