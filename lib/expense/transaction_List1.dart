/*import 'package:flutter/material.dart';
import 'package:flutter_app/model/Transaction.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  var title = TextEditingController();
  var amount = TextEditingController();

  List<Transaction> tranLis = [
    Transaction(
      date: DateTime.now(),
      id: 1,
      price: 1450,
      productName: 'Sparx shoes',
    ),
    Transaction(
      date: DateTime.now(),
      id: 2,
      price: 1500,
      productName: 'Dominar Cover',
    )
  ];

  addingToList() {
    tranLis.add(Transaction(
        id: 3,
        date: DateTime.now(),
        price: int.parse(amount.text),
        productName: title.text));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: title,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amount,
              ),
              FlatButton(
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.purple),
                ),
                onPressed: () {
                  print(title.text + amount.text);
                  addingToList();
                },
              ),
            ],
          ),
        ),
      ),
      ...tranLis.map(
        (tx) {
          return Card(
            elevation: 5,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    '${tx.price}₹',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.purple),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tx.productName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      tx.date.toString(),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    ]);
  }
}
*/
