import 'package:expense/classes/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;
  TransactionList(this.transactions, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No entries provided',
                  style: TextStyle(color: Colors.black26),
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                      'assets/fonts/images/32350_waiting_256x256.png',
                      fit: BoxFit.cover),
                )
              ],
            )
          : Column(
              children: transactions.map(
                (tx) {
                  return Card(
                      elevation: 2.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            //color: Colors.deepPurple,
                            height: 30,
                            width: 110,
                            margin: EdgeInsets.all(9),
                            child: FittedBox(
                              child: Text('Rs ${tx.amount.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Theme.of(context).primaryColorDark,
                                  )),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tx.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.black),
                                ),
                                Text(
                                  DateFormat.yMMMEd().format(tx.date),
                                  style: TextStyle(color: Colors.black54),
                                ) 
                              ],
                            ),
                          ),
                           IconButton(onPressed:(){deletetx(tx.id);} , icon: Icon(Icons.delete),color: Colors.black38,)
                        ],
                      ));
                },
              ).toList(),
            ),
    );
  }
}
