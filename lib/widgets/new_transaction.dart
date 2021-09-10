import 'package:flutter/material.dart';


class NewTransaction extends StatefulWidget {
  final Function addnewtx;

  NewTransaction(this.addnewtx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  void submitdata() {
    if (titlecontroller.text.isEmpty || amountcontroller.text.isEmpty) {
      return;
    }
    widget.addnewtx(
      titlecontroller.text,
      double.parse(amountcontroller.text),

      
    );

    Navigator.of(context).pop();
  }

  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      color: Colors.grey.shade100,
      margin: EdgeInsets.all(6),
      child: Container(
        //margin: EdgeInsets.only(left: 9),
        margin: EdgeInsets.symmetric(vertical: 1, horizontal: 9),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Item Title',
              ),
              controller: titlecontroller,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Item Amount'),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              onPressed: submitdata,
              child: Text(
                'Add Item',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
