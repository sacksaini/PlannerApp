import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingamount;
  final double spendingPctofTotal;
  ChartBar(this.label, this.spendingamount, this.spendingPctofTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text("\u{20B9}${spendingamount.toStringAsFixed(0)}")),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 40,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                //Shrinks the text to fit similar to other Bars
                heightFactor: spendingPctofTotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text("$label")
      ],
    );
  }
}
