import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/add_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//String inputTitle, inputAmount;

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 5000, date: DateTime.now()),
    Transaction(id: 't2', title: 'Glass', amount: 8000, date: DateTime.now()),
    Transaction(id: 't3', title: 'Glass', amount: 8000, date: DateTime.now()),
    Transaction(id: 't4', title: 'Glass', amount: 8000, date: DateTime.now()),
    Transaction(id: 't5', title: 'Glass', amount: 8000, date: DateTime.now()),
    Transaction(id: 't6', title: 'Glass', amount: 8000, date: DateTime.now()),
    Transaction(id: 't7', title: 'Glass', amount: 8000, date: DateTime.now()),
    Transaction(id: 't8', title: 'Glass', amount: 8000, date: DateTime.now()),
    Transaction(id: 't9', title: 'Glass', amount: 8000, date: DateTime.now()),
    Transaction(id: 't10', title: 'Glass', amount: 8000, date: DateTime.now()),
    Transaction(id: 't11', title: 'Glass', amount: 8000, date: DateTime.now()),
    Transaction(id: 't12', title: 'Glass', amount: 8000, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: AddTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: <Widget>[
          IconButton(
            onPressed: () => {_startAddNewTransaction(context)},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.amber,
              child: Text('CHART'),
              elevation: 5,
            ),
          ),
          TransactionList(_userTransactions),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {_startAddNewTransaction(context)}),
    );
  }
}
