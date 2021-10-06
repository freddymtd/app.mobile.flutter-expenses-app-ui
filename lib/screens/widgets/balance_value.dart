import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.amber),
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Balance",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                "R\$ 2000,00",
                style: TextStyle(fontSize: 36),
              )
            ],
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Icon(Icons.visibility),
          )
        ],
      ),
    );
  }
}
