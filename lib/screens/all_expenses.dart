import 'package:expanse_provider/widgets/all_expense_screen/all_expense_fetcher.dart';
import 'package:flutter/material.dart';

class AllExpenses extends StatefulWidget {
  const AllExpenses({super.key});
  static const name = '/all_expenses';

  @override
  State<AllExpenses> createState() => _AllExpensesState();
}

class _AllExpensesState extends State<AllExpenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Expenses'),
        ),
        body: AllExpenseFetcher());
  }
}
