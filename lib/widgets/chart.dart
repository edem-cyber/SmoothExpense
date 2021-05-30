import 'package:flutter/material.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  List<Transaction> recentTransactions;
  List<Map<String, Object>> get groupedTransactions{
    //TODO: COMPLETE FROM HERE
    // return List.generate(7, (index) => {'day':'T', 'amount': 9.99})
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          
        ],
      ),
    );
  }
}
