import 'package:flutter/material.dart';

class InputTransaction extends StatelessWidget {
  final title = TextEditingController();
  final amount = TextEditingController();
  final Function submit;

  InputTransaction(this.submit, {Key? key}) : super(key: key);

  void submitData() {
    if (amount.text.isEmpty || title.text.isEmpty) {
      return;
    }     
    submit(title.text, double.parse(amount.text));
    title.clear();
    amount.clear();
  }



  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: title,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amount,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              child: Text('Add Transaction'),
              
              onPressed: submitData,
            ),
          ]),
        ));
  }
}
