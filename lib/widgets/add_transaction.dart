import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTx;

  AddTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              /*onChanged: (val) {
                      inputTitle = val;
                    },*/
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: OutlinedButton(
                onPressed: () {
                  addTx(titleController.text,
                      double.parse(amountController.text));
                },
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
