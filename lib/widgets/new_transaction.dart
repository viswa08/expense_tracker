import 'package:flutter/material.dart';
import 'transaction_list.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionfn;
  NewTransaction(this.addTransactionfn);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  //function to add transaction
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTransactionfn(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
              textInputAction: TextInputAction.done,
              onSubmitted: (value) => submitData(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              textInputAction: TextInputAction.done,
              onSubmitted: (value) => submitData(),
            ),
          ),
          TextButton(
            onPressed: submitData,
            child: const Text(
              'Add Transaction',
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }
}
