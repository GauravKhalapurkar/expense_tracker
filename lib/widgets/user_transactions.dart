import 'package:flutter/material.dart';

import './add_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  UserTransactionsState createState() => UserTransactionsState();
}

class UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 5000, date: DateTime.now()),
    Transaction(id: 't2', title: 'Glass', amount: 8000, date: DateTime.now()),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
