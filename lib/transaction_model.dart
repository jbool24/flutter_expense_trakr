import 'package:uuid/uuid.dart';

final List<Transaction> txEntries = [Transaction('Books', 12.00)];

class Transaction {
  String id;
  String title;
  double amount;
  DateTime date;

  Transaction(String title, double amount, [DateTime date]) {
    this.id = Uuid().v4();
    this.title = title;
    this.amount = amount == null ? 0.0 : amount;
    this.date = date == null ? DateTime.now() : date;
  }

  static Transaction getByID(String id) {
    return txEntries.where((tx) => tx.id == id).first;
  }

  static List<Transaction> addNew(String title, double amount,
      [DateTime date]) {
    txEntries.add(Transaction(title, amount, date));
    return entries;
  }

  static List<Transaction> delete(String id) {
    Function removeId(String id) => (tx) => tx.id == id;

    txEntries.removeWhere(removeId(id));

    return txEntries;
  }

  static List<Transaction> update(String id, Object update) {
    return txEntries;
  }

  static List<Transaction> get entries {
    return [...txEntries];
  }
}
