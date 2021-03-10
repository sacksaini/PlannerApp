import 'package:flutter/material.dart';
import 'package:timer/models/transaction.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

// The Instance of this class is called inside the UserTransactions.dart file. The main motive of this seperate file is to make th code more manageable

class TransactionList extends StatelessWidget {
//  final ScrollController _controllerOne = ScrollController();
  final List<Transaction> userTransaction;
  TransactionList(this.userTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: userTransaction.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions Added yet!",
                  style: Theme.of(context).textTheme.headline5,
                  //textScaleFactor: 0.8,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 150,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            )
          : Scrollbar(
              thickness: 4,
              radius: Radius.circular(20),
              //  controller: _controllerOne,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
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
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            '\u{20B9}${userTransaction[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userTransaction[index].title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateFormat('h:mm a | d MMM, y')
                                  .format(userTransaction[index].date),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: userTransaction.length,
              ),
            ),
    );
  }
}
