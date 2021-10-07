import 'dart:math';

import 'package:expenses_app/constant.dart';
import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/repositories/transactions_repository.dart';
import 'package:expenses_app/screens/widgets/balance_value.dart';
import 'package:expenses_app/screens/widgets/expenses_group.dart';
import 'package:expenses_app/screens/widgets/new_transaction.dart';
import 'package:expenses_app/screens/widgets/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    Navigator.pop(context);
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: Icon(Icons.dehaze),
        title: Text(
          'Expenses',
          style: GoogleFonts.roboto(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 24),
              BalanceWidget(),
              SizedBox(height: 24),
              ExpensesGroup(),
              SizedBox(height: 24),
              Text(
                "Últimas transações",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              TransactionList(_userTransactions, _deleteTransaction),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
