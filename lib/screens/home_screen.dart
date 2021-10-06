import 'package:expenses_app/constant.dart';
import 'package:expenses_app/screens/widgets/balance_value.dart';
import 'package:expenses_app/screens/widgets/expenses_group.dart';
import 'package:expenses_app/screens/widgets/user_transactions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              UserTransactions(),
            ],
          ),
        ),
      ),
    );
  }
}
