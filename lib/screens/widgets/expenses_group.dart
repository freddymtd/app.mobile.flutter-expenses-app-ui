import 'package:flutter/material.dart';

class ExpensesGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Container(
            height: 72,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.green),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                children: [
                  Icon(Icons.north_west, color: Colors.white),
                  Text(
                    "Receita",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        InkWell(
          child: Container(
            height: 72,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.red),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Row(
                children: [
                  Text(
                    "Despesa",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.south_east, color: Colors.white),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
