import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../classes/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  void addnewtransaction(String title, double amount) {
    final newtx =
        Transaction(DateTime.now().toString(), title, amount, DateTime.now());

    setState(() {
      usertransactions.add(newtx);
    });
  }

  final List<Transaction> usertransactions = [
    Transaction('i1', 'Shirt', 200, DateTime.now()),
    Transaction('i2', 'T-Shirt', 600, DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addnewtransaction),
        TransactionList(usertransactions),
      ],
    );
  }
}
