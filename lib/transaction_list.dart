import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  Card transactionItem(Transaction tx) {
    return Card(
      child: Row(children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 2),
            ),
            child: Text('\$${tx.amount.toStringAsFixed(2)}')),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text(
            tx.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          Text(DateFormat('MM-dd-yyyy').format(tx.date),
              style: TextStyle(color: Colors.grey))
        ]),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return transactionItem(_transactions[index]);
          },
          itemCount: _transactions.length,
        ));
  }
}
