import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smoothexpense/widgets/new_transaction.dart';
import 'package:smoothexpense/widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.purple[900],
        fontFamily: 'SanFransisco',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  void _addNewTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        amount: txamount,
        title: txtitle,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTrnasaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return Container(
            child: SingleChildScrollView(
                child: NewTransaction(_addNewTransaction)),
            height: MediaQuery.of(context).size.height * .3,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return _startAddNewTrnasaction(context);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                return _startAddNewTrnasaction(context);
              })
        ],
        title: Text('Smooth Expense'),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Card(
                  color: Theme.of(context).primaryColorDark,
                  child: Text('CHART',
                      style: TextStyle(
                          color: Theme.of(context).primaryColorLight)),
                  elevation: 5,
                )),
            TransactionList(_userTransactions)
          ],
        ),
      ),
    );
  }
}
