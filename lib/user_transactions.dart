import 'package:flutter/material.dart';
import 'package:flutter_expense_trakr/new_transaction.dart';
import 'package:flutter_expense_trakr/transaction.dart';
import 'package:flutter_expense_trakr/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: '1', title: 'New Shirt', amount: 60.00, date: DateTime.now()),
    Transaction(
        id: '2', title: 'New Shoes', amount: 80.00, date: DateTime.now()),
    Transaction(
        id: '3', title: 'New Pants', amount: 80.00, date: DateTime.now()),
    Transaction(
        id: '4', title: 'New Belt', amount: 80.00, date: DateTime.now()),
    Transaction(
        id: '5', title: 'Groceries', amount: 80.00, date: DateTime.now()),
    Transaction(
        id: '6', title: 'Chew Toy', amount: 80.00, date: DateTime.now()),
    Transaction(
        id: '7', title: 'Paper Cups', amount: 80.00, date: DateTime.now())
  ];

  void _createTransaction(String title, double amount) {
    setState(() {
      _userTransactions.add(Transaction(
          id: DateTime.now().toString(),
          title: title,
          amount: amount,
          date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NewTransaction(_createTransaction),
      TransactionList(_userTransactions),
    ]);
  }
}
