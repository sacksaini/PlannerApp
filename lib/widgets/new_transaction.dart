import 'package:flutter/material.dart';

// The Instance of this class is called inside the UserTransactions.dart file. The main motive of this seperate file is to make th code more manageable

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    if (titleController.text.isEmpty ||
        {double.parse(amountController.text)}.isEmpty) {
      return;
    }
    widget.addTx(
      titleController.text,
      double.parse(amountController.text),
    );
    Navigator.of(context).pop();
  }

  void _addDatePicker() {
    showDatePicker(
      // helpText: "Date of Spending money!",
      //initialEntryMode: DatePickerEntryMode.input,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            Row(
              children: [
                Text("No Date Chosen!"),
                FlatButton(
                  onPressed: () => _addDatePicker(),
                  textColor: Theme.of(context).primaryColor,
                  child: Text("Choose Date"),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              color: Theme.of(context).primaryColorDark,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
