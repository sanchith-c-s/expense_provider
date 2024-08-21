import 'package:expanse_provider/models/database_provider.dart';
import 'package:expanse_provider/widgets/all_expense_screen/all_expense_list.dart';
import 'package:expanse_provider/widgets/all_expense_screen/expense_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllExpenseFetcher extends StatefulWidget {
  const AllExpenseFetcher({super.key});

  @override
  State<AllExpenseFetcher> createState() => _AllExpenseFetcherState();
}

class _AllExpenseFetcherState extends State<AllExpenseFetcher> {
  late Future _allExpensesList;

  Future _getAllExpenses() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchAllExpenses();
  }

  @override
  @override
  void initState() {
    super.initState();
    _allExpensesList = _getAllExpenses();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _allExpensesList,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ExpenseSearch(),
                    Expanded(child: AllExpensesList()),
                  ],
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}


