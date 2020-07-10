import 'package:flutter/foundation.dart';

class Transaction {
  String id;
  String title;
  double amount;
  DateTime date;

  final List<Transaction> mockEntries = [
    Transaction(
        id: '1', title: 'New Shirt', amount: 60.00, date: DateTime.now()),
    Transaction(
        id: '2', title: 'New Shoes', amount: 80.00, date: DateTime.now())
  ];

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
