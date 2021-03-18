import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingamount;
  final double spendingPctofTotal;
  ChartBar(this.label, this.spendingamount, this.spendingPctofTotal);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      return Column(
        children: [
          FittedBox(
              child: Text("\u{20B9}${spendingamount.toStringAsFixed(0)}")),
          SizedBox(
            height: (constraint.maxHeight) * 0.05,
          ),
          Container(
            height: (constraint.maxHeight) * 0.6,
            width: 10,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
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
            height: (constraint.maxHeight) * 0.05,
          ),
          Container(
            height: (constraint.maxHeight) * 0.15,
            child: FittedBox(child: Text("$label")),
          ),
        ],
      );
    });
  }
}
