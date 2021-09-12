import './widgets/new_transaction.dart';
import './widgets/chart.dart';
import 'classes/transaction.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      theme: ThemeData(
        fontFamily: 'Poppins',
        //textTheme: ThemeData.light().copyWith(text),
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transaction = [];

  void addnewtransaction(String title, double amount, DateTime chosendate) {
    final newtx =
        Transaction(DateTime.now().toString(), title, amount, chosendate);

    setState(() {
      usertransactions.add(newtx);
    });
  }

  void deletetransaction(String id) {
    setState(() {
      usertransactions.removeWhere((tx) => tx.id == id);
    });
  }

  final List<Transaction> usertransactions = [
    // Transaction('i1', 'Shirt', 200, DateTime.now()),
    //Transaction('i2', 'T-Shirt', 600, DateTime.now()),
  ];
  List<Transaction> get recentransaction {
    return usertransactions.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void startnewtrx(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bctx) {
        return NewTransaction(addnewtransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense App',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {
              startnewtrx(context);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Chart(recentransaction),
            TransactionList(usertransactions, deletetransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startnewtrx(context);
        },
      ),
    );
  }
}
