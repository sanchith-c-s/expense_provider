import 'package:expanse_provider/models/database_provider.dart';
import 'package:expanse_provider/screens/category_screen.dart';
import 'package:expanse_provider/screens/expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => DatabaseProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CategoryScreen.name,
      routes: {
        CategoryScreen.name: (_) => CategoryScreen(),
        ExpenseScreen.name: (_) => ExpenseScreen(),
      },
    );
  }
}
