import 'package:flutter/material.dart';
import 'transaction_list.dart';
import 'user_transaction.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransactionfn;
  NewTransaction(this.addTransactionfn);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  //function to add transaction
  void addTransation() {
    addTransactionfn(titleController.text, double.parse(amountController.text));
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
              onSubmitted: (value) {
                if (titleController.text.isNotEmpty &&
                    amountController.text.isNotEmpty) {
                  addTransation();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {
                if (titleController.text.isNotEmpty &&
                    amountController.text.isNotEmpty) {
                  addTransation();
                }
              },
            ),
          ),
          TextButton(
            onPressed: () {
              print(titleController.text);
              addTransation();
            },
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
