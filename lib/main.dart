import 'package:flutter/material.dart';
import 'widgets/user_transaction.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  //Input controllers

  //list of transaction class
  final txList = UserTransaction();

  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Personal Expenses'),
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.blue,
                    child: const Text('CHART!'),
                    elevation: 5,
                  )),
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
