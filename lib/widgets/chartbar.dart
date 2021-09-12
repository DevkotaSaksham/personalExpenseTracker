import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendamt;
  final double percentfromtotal;

  ChartBar(this.label, this.spendamt, this.percentfromtotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 17,
          child: FittedBox(
            child: Text(
              '${spendamt.toStringAsFixed(0)}',
              style: TextStyle(color: Colors.black26),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 70,
          width: 15,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38, width: 1),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentfromtotal,
                child: Container(
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Theme.of(context).primaryColorLight,
                )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text('$label', style: TextStyle(color: Colors.black54))
      ],
    );
  }
}
