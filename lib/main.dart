import 'package:flutter/material.dart';
import 'package:flutter_expense_trakr/new_transaction.dart';
import 'package:flutter_expense_trakr/theme.dart';
import 'package:flutter_expense_trakr/transaction_bloc.dart';
import 'package:flutter_expense_trakr/transaction_model.dart';
import 'package:flutter_expense_trakr/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      home: MyHomePage(title: 'Personal Expenses'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final TransactionController _txController = TransactionController();

  void _startAddNewTrasaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(_txController);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTrasaction(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTrasaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 10,
              child: Text(
                'Chart!!',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          UserTransactions(Transaction.entries),
        ],
      )),
    );
  }
}
