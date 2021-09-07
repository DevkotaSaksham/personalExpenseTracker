import 'package:flutter/material.dart';
import './user_transaction.dart';

class NewTransaction extends StatelessWidget {
  void submitdata() {
    if (titlecontroller.text.isEmpty || amountcontroller.text.isEmpty) {
      return;
    }
    addnewtx(
      titlecontroller.text,
      double.parse(amountcontroller.text),
    );
  }

  //const NewTransaction({ Key? key }) : super(key: key);
  final Function addnewtx;
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  NewTransaction(this.addnewtx);
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
                  color: Colors.deepPurpleAccent,
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
