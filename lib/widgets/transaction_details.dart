import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TransactionDetails extends StatefulWidget {
  //final Function txdetails;
  //TransactionDetails();

  @override
  _TransactionDetailsState createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      child: Text(" Transaction Details"),
    );
  }
}
