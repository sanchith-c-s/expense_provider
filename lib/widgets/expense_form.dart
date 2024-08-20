import 'package:expanse_provider/constants/icons.dart';
import 'package:expanse_provider/models/database_provider.dart';
import 'package:expanse_provider/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _title = TextEditingController();
  final _amount = TextEditingController();
  DateTime? _date;
  String _initialValue = 'Other';

  _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2022),
        lastDate: DateTime.now(),
        initialDate: DateTime.now());

    if (pickedDate != null) {
      setState(() {
        _date = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _title,
              decoration: InputDecoration(labelText: 'Title of expense'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _amount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount of expense',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(_date != null
                        ? DateFormat('MMMM dd, yyyy').format(_date!)
                        : 'Select Date')),
                IconButton(
                    onPressed: () => _pickDate(),
                    icon: Icon(Icons.calendar_month)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(child: Text('Category')),
                Expanded(
                    child: DropdownButton(
                  items: icons.keys
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  value: _initialValue,
                  onChanged: (newValue) {
                    setState(() {
                      _initialValue = newValue!;
                    });
                  },
                ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  if (_title.text != '' && _amount.text != '') {
                    final file = Expense(
                        id: 0,
                        title: _title.text,
                        amount: double.parse(_amount.text),
                        date: _date != null ? _date! : DateTime.now(),
                        category: _initialValue);
                    provider.addExpense(file);

                    Navigator.of(context).pop();
                  }
                },
                icon: Icon(Icons.add),
                label: Text('Add Expense'))
          ],
        ),
      ),
    );
  }
}
