import 'package:flutter_expense_trakr/transaction_model.dart';

class TransactionController {
  List<Transaction> addNew(String title, double amount) {
    return Transaction.addNew(title, amount);
  }
}
