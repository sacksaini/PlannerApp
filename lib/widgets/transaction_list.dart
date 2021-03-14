import 'package:flutter/material.dart';
import 'package:timer/models/transaction.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

// The Instance of this class is called inside the UserTransactions.dart file. The main motive of this seperate file is to make th code more manageable

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  final Function deleteTx;
  TransactionList(this.userTransaction, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 580,
      child: userTransaction.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "No Transactions Added!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 100,
                    child: Image.asset("assets/images/waiting.png"))
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: userTransaction.map((tx) {
                  return Card(
                    shadowColor: Colors.purple,
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 4),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 24,
                        child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("\u{20B9}${tx.amount}"),
                          ),
                        ),
                      ),
                      title: Text(
                        tx.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                          Text(DateFormat('h:mm a | d MMM, y').format(tx.date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteTx(tx.id),
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}

// Old card view chosen to Display the tiles, now I use the List Tile.
/*return Card(
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
            );*/
