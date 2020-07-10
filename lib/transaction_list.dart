import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget._transactions.map((tx) {
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
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
      }).toList(),
    );
  }
}
