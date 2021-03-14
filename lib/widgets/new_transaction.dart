import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// The Instance of this class is called inside the UserTransactions.dart file. The main motive of this seperate file is to make th code more manageable

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_titleController.text.isEmpty ||
        {double.parse(_amountController.text)}.isEmpty ||
        _selectedDate == null) {
      return;
    }
    widget.addTx(_titleController.text, double.parse(_amountController.text),
        _selectedDate);
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
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(_selectedDate == null
                      ? "No Date Chosen!"
                      : "Picked Date: ${DateFormat.yMd().format(_selectedDate)}"),
                ),
                FlatButton(
                  onPressed: () => _addDatePicker(),
                  textColor: Theme.of(context).primaryColor,
                  child: Text("Choose Date"),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: _submitData,
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
