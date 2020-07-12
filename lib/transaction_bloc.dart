import 'package:flutter_expense_trakr/observables.dart';
import 'package:flutter_expense_trakr/transaction_model.dart';

class TransactionController implements Observer {
  final List<Observable> listeners = [];

  @override
  void register(Observable subject) {
    listeners.add(subject);
    print('called register: $subject');
    print('Listeners count: ${listeners.length}');
  }

  @override
  void notify() {
    print('called notify');
    print(listeners.length);
    for (Observable listener in listeners) {
      print('Listener');
      print(listener.toString());
      listener.update(Transaction.entries);
    }
  }

  void addNew(String title, double amount, DateTime date) {
    Transaction.addNew(title, amount, date);
    this.notify();
    return;
  }

  void delete(String id) {
    Transaction.delete(id);
    this.notify();
    return;
  }
}
