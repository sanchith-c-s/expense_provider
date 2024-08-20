import 'package:expanse_provider/widgets/category_screen/category_fetcher.dart';
import 'package:expanse_provider/widgets/expense_form.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  static const name = '/category_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: CategoryFetcher(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => ExpenseForm(),
        );
      }),
    );
  }
}
