import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget {
  final Function addnewtx;

  NewTransaction(this.addnewtx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  void submitdata() {
    if (titlecontroller.text.isEmpty || amountcontroller.text.isEmpty || selecteddate==null) {
      return;
    }
    widget.addnewtx(
      titlecontroller.text,
      double.parse(amountcontroller.text),
      selecteddate
    );

    Navigator.of(context).pop();
  }

  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();
  DateTime selecteddate;

  void presentdatepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickeddate) {
      if (pickeddate == null) {
        return;
      }
      setState(() {
        selecteddate = pickeddate;
      });
    });
  }

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
            Row(
              children: [
                Expanded(
                  child: Text(
                    selecteddate == null ? 'No date chosen' : DateFormat.yMMMEd().format(selecteddate),
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                FlatButton(
                    onPressed: presentdatepicker,
                    child: Text('Choose date here',
                        style: TextStyle(color: Colors.deepOrange)))
              ],
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
