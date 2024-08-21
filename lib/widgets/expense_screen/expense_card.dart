import 'package:expanse_provider/constants/icons.dart';
import 'package:expanse_provider/models/database_provider.dart';
import 'package:expanse_provider/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ExpenseCard extends StatelessWidget {
  final Expense exp;
  const ExpenseCard(this.exp, {super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return Dismissible(
      key: ValueKey(exp.id),
      onDismissed: (_) {
        provider.deleteExpense(exp.id, exp.category, exp.amount);
      },
      child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icons[exp.category]),
          ),
          title: Text(exp.title),
          subtitle: Text(DateFormat('MMMM dd, yyyy').format(exp.date)),
          trailing: Text(NumberFormat.currency(locale: 'en_IN', symbol: '₹')
              .format(exp.amount))),
    );
  }
}
