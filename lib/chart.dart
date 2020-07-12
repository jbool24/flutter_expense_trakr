import 'package:flutter/material.dart';
import 'package:flutter_expense_trakr/observables.dart';
import 'package:flutter_expense_trakr/transaction_bloc.dart';
import 'package:flutter_expense_trakr/transaction_model.dart';
import 'package:intl/intl.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(
      {this.label = 'Spending', this.spendingAmount, this.spendingPctOfTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 20,
            child: FittedBox(
                child: Text(
              "\$${spendingAmount.toStringAsFixed(0)}",
            ))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 200, 1),
                ),
              ),
              FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}

class Chart extends StatefulWidget {
  final TransactionController _txController;

  Chart(this._txController);

  @override
  State<StatefulWidget> createState() => _ChartState();
}

class _ChartState extends State<Chart> implements Observable {
  List<Transaction> _txList;

  @override
  void initState() {
    super.initState();
    widget._txController.register(this);
    _txList = Transaction.entries;
  }

  @override
  void update(list) {
    setState(() {
      this._txList = _recentTransactions(list);
    });
  }

  List<Transaction> _recentTransactions(List<Transaction> list) {
    return list.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (var i = 0; i < _txList.length; i++) {
        if (_txList[i].date.day == weekDay.day &&
            _txList[i].date.month == weekDay.month &&
            _txList[i].date.year == weekDay.year) {
          totalSum += _txList[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionsValues.fold(0.0, (acc, curr) {
      return (acc += curr['amount']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 12,
        margin: EdgeInsets.all(20),
        color: Color.fromRGBO(220, 220, 220, 1.0),
        child: Container(
          child: Column(children: <Widget>[
            Row(
              children: [
                Text(
                  'Daily Spendings',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.left,
                )
              ],
            ),
            Row(
              children: groupedTransactionsValues.map((data) {
                return Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                        label: data['day'],
                        spendingAmount: data['amount'],
                        spendingPctOfTotal: totalSpending == 0.0
                            ? 0.0
                            : (data['amount'] as double) / totalSpending));
              }).toList(),
            ),
          ]),
          padding: EdgeInsets.all(10),
        ));
  }
}
