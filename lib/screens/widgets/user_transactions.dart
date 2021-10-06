import 'dart:math';

import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/repositories/transactions_repository.dart';
import 'package:expenses_app/screens/widgets/new_transaction.dart';
import 'package:expenses_app/screens/widgets/transactions_list.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final _userTransactions = TransactionRepository.transactions;

  void _addNewTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTx = Transaction(
      id: Random().nextInt(101).toString(),
      title: txTitle,
      amount: txAmount,
      date: txDate,
      icon: Icon(Icons.air),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_userTransactions),
        NewTransaction(_addNewTransaction),
      ],
    );
  }
}
