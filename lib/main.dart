import 'package:expenses_app/constant.dart';
import 'package:expenses_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Expenses App',
      home: HomeScreen(),
    );
  }
}
