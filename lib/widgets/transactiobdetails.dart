import 'package:flutter/material.dart';
import 'input_transaction.dart';
import 'transactionlist.dart';
import '../models/transaction.dart';

class TransactionDetails extends StatefulWidget {
  const TransactionDetails({Key? key}) : super(key: key);

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
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

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InputTransaction(_newTransaction),
      TransactionList(_userTransaction),
    ]);
  }
}

  
  
