import './widgets/new_transaction.dart';

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

  void addnewtransaction(String title, double amount) {
    final newtx =
        Transaction(DateTime.now().toString(), title, amount, DateTime.now());

    setState(() {
      usertransactions.add(newtx);
    });
  }

  final List<Transaction> usertransactions = [
   // Transaction('i1', 'Shirt', 200, DateTime.now()),
    //Transaction('i2', 'T-Shirt', 600, DateTime.now()),
  ];

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
        
        title: Text('Expense App',style: TextStyle(fontSize: 21,fontWeight: FontWeight.w700 ),),
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
            Container(
              width: double.infinity,
              child: Card(
                child: Text('chart'),
              ),
            ),
            TransactionList(usertransactions)
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
