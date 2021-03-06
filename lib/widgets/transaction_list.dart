import 'package:flutter/material.dart';
import 'package:timer/models/transaction.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

// The Instance of this class is called inside the UserTransactions.dart file. The main motive of this seperate file is to make th code more manageable

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  TransactionList(this.userTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: userTransaction.map((tx) {
            return Card(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      '\u{20B9}${tx.amount}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('h:mm a | d MMM, y').format(tx.date),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
