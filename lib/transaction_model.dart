import 'package:flutter/foundation.dart';

final List<Transaction> txEntries = [
  Transaction(id: '1', title: 'New Shirt', amount: 60.00, date: DateTime.now()),
  Transaction(id: '2', title: 'New Shoes', amount: 80.00, date: DateTime.now()),
  Transaction(id: '3', title: 'New Pants', amount: 80.00, date: DateTime.now()),
  Transaction(id: '4', title: 'New Belt', amount: 80.00, date: DateTime.now()),
  Transaction(id: '5', title: 'Groceries', amount: 80.00, date: DateTime.now()),
  Transaction(id: '6', title: 'Chew Toy', amount: 80.00, date: DateTime.now()),
  Transaction(id: '7', title: 'Paper Cups', amount: 80.00, date: DateTime.now())
];

class Transaction {
  String id;
  String title;
  double amount;
  DateTime date;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});

  static List<Transaction> addNew(String title, double amount) {
    entries.add(Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now()));
    return entries;
  }

  static get entries => txEntries;
}
