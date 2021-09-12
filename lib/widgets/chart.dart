import 'package:expense/classes/transaction.dart';
import 'package:expense/widgets/chartbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recenttransactions;
  Chart(this.recenttransactions);
  List<Map<String, Object>> get groupedtransactionvalues {
    return List.generate(
      7,
      (index) {
        final weekday = DateTime.now().subtract(Duration(days: index));
        double sum = 0;
        for (int i = 0; i < recenttransactions.length; i++) {
          if (recenttransactions[i].date.day == weekday.day &&
              recenttransactions[i].date.month == weekday.month &&
              recenttransactions[i].date.year == weekday.year) {
            sum = sum + recenttransactions[i].amount;
          }
        }

        return {
          'day': DateFormat.E().format(weekday).substring(0, 1),
          'amount': sum
        };
      },
    ).reversed.toList();
  }

  double get totalspending {
    return groupedtransactionvalues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedtransactionvalues);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupedtransactionvalues.map(
            (data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'],
                    data['amount'],
                    totalspending == 0
                        ? 0
                        : (data['amount'] as double) / totalspending),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
