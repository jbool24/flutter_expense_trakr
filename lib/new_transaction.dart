import 'package:flutter/material.dart';
import 'package:flutter_expense_trakr/transaction_bloc.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final TransactionController txController;

  NewTransaction(this.txController);

  @override
  State<StatefulWidget> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  DateTime _txDate;

  void submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _txDate == null) return;

    setState(() {
      widget.txController.addNew(enteredTitle, enteredAmount, _txDate);
    });

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime(DateTime.now().year + 4))
        .then((selectedDate) {
      if (selectedDate == null) return;
      setState(() {
        _txDate = selectedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                    keyboardType: TextInputType.text,
                    onSubmitted: (_) => submitData,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => submitData,
                  ),
                  Container(
                      height: 70,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            _txDate == null
                                ? 'No Date Chosen!'
                                : DateFormat.yMd().format(_txDate),
                          )),
                          FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            child: Text('Chose Date'),
                            onPressed: _presentDatePicker,
                          )
                        ],
                      )),
                  RaisedButton(
                    onPressed: submitData,
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                    child: Text('Add Transaction'),
                  )
                ])));
  }
}
