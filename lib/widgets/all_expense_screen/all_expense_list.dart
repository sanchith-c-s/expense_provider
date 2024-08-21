import 'package:expanse_provider/models/database_provider.dart';
import 'package:expanse_provider/widgets/expense_screen/expense_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllExpensesList extends StatelessWidget {
  const AllExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (_, db, __) {
        var list = db.expense;
        return list.isNotEmpty
            ? ListView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: list.length,
                itemBuilder: (_, i) => ExpenseCard(list[i]))
            : Center(
                child: Text('No Entries Found'),
              );
      },
    );
  }
}
