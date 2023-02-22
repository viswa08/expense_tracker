import 'package:flutter/material.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  //list of transaction class

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

  void _startAddNewTransation(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          print('New transaction');
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(_addTransaction));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransation(context),
            icon: Icon(Icons.add),
          )
        ],
        title: const Text('Personal Expenses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                width: double.infinity,
                child: const Card(
                  color: Colors.blue,
                  elevation: 5,
                  child: Text('CHART!'),
                )),
            TransactionList(_userTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransation(context),
      ),
    );
  }
}
