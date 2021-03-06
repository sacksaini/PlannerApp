import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text("CHART"),
                color: Colors.lightBlue,
                elevation: 5,
              ),
            ),
            UserTransactions(), // In this instance of a class, we call the other two widgets too i.e. NewTransactionand TransactionList.
            //Reason is that , in casewe want to change something particulary in List, then we can use onlt TransactionList and if only add a transaction, then call NewTransaction.
            //But instances of both classes are always called with this instance of UserTransactions.
          ],
        ),
      ),
    );
  }
}
