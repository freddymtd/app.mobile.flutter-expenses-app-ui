import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionRepository {
  static List<Transaction> transactions = [
    Transaction(
        id: 't1',
        title: 'Chaveiro',
        amount: 1000.002,
        date: DateTime.now(),
        icon: Icon(Icons.car_rental)),
    Transaction(
        id: 't2',
        title: 'Academia',
        amount: 79.903,
        date: DateTime.now(),
        icon: Icon(Icons.fitness_center)),
    Transaction(
        id: 't3',
        title: 'Mercado',
        amount: 154.220,
        date: DateTime.now(),
        icon: Icon(Icons.storefront)),
  ];
}
