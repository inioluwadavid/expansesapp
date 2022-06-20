import 'package:flutter/material.dart';
// import './widgets/transactiobdetails.dart';
import './widgets/input_transaction.dart';
import './models/transaction.dart';
import './widgets/transactionlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Grocery',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  void _newTransaction(String txTitle, double txAmount) {
    var newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _newTransactionAdd(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: (() {}), child: InputTransaction(_newTransaction));
          behaviour:
          HitTestBehavior.opaque;
        });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expenses Calculator'),
          actions: [
            IconButton(
                onPressed: (() => _newTransactionAdd(context)),
                icon: Icon(Icons.add)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.amber,
                child: Card(
                  child: Text('Expanses chart'),
                ),
              ),
              TransactionList(_userTransaction),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: (() => _newTransactionAdd(context)),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
