import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_expense_trakr/observables.dart';
import 'package:flutter_expense_trakr/transaction_bloc.dart';
import 'package:flutter_expense_trakr/transaction_model.dart';
import 'package:intl/intl.dart';

import './transaction_model.dart';

class TransactionList extends StatefulWidget {
  final TransactionController _txController;

  TransactionList(this._txController);

  @override
  State<StatefulWidget> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList>
    implements Observable {
  List<Transaction> _txList;

  @override
  void initState() {
    super.initState();
    widget._txController.register(this);
    this._txList = Transaction.entries;
  }

  @override
  void update(list) {
    print(list);
    setState(() {
      print('Called set State in List');
      _txList = list;
    });
  }

  void _delete(id) {
    widget._txController.delete(id);
  }

  Widget transactionItem(BuildContext context, Transaction tx) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: FittedBox(
            child: Text('\$${tx.amount.toStringAsFixed(2)}'),
          ),
        ),
      ),
      title: Text(
        tx.title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      subtitle: Text(
        DateFormat('MM-dd-yyyy').format(tx.date),
        style: TextStyle(color: Colors.grey),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        color: Theme.of(context).errorColor,
        onPressed: () => _delete(tx.id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        child: Transaction.entries.isEmpty
            ? Column(children: <Widget>[
                Text(
                  'No transactions added',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 20),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png'))
              ])
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      elevation: 6,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 5,
                      ),
                      child: transactionItem(context, _txList[index]));
                },
                itemCount: _txList.length,
              ));
  }
}
