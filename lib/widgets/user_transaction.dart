import 'package:flutter/material.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';
import 'package:expense_tracker/models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
        title: 'Shorts', amount: 908.0, date: DateTime.now(), id: 'Tx1'),
    Transaction(
        title: 'Biriyani', amount: 848.50, date: DateTime.now(), id: 'Tx2'),
  ];

  void _addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
