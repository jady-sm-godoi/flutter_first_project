import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_expenses/models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  const TransactionsList({
    Key? key,
    required this.transactions,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 480,
        child: transactions.isEmpty
            ? Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Não há transações, ainda...',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 10),
                  Container(
                      height: 200,
                      padding: EdgeInsets.all(20),
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctex, index) {
                  final tr = transactions[index];
                  return Card(
                    elevation: 6,
                    margin: EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FittedBox(
                            child: Text('R\$${tr.value}'),
                          ),
                        ),
                      ),
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(DateFormat('dd / MM / y').format(tr.date)),
                      trailing: FittedBox(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () => onRemove(tr.id),
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ));
  }
}
