import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function newTransactionHandler;

  NewTransaction(this.newTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (val) {
                  titleInput = val;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                onChanged: (val) {
                  amountInput = val;
                },
              ),
              FlatButton(
                onPressed: () {
                  print("Create transaction: $amountInput $titleInput");
                  widget.newTransactionHandler(titleInput, amountInput);
                },
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.purple),
                ),
              )
            ])));
  }
}
