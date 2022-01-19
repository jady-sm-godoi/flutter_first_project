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
    return SizedBox(
        height: 480,
        child: transactions.isEmpty
            ? LayoutBuilder(
                builder: (ctx, constraints) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Não há transações, ainda...',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 20),
                      Container(
                          height: constraints.maxHeight * 0.6,
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/images/waiting.png',
                            fit: BoxFit.cover,
                          ))
                    ],
                  );
                },
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctex, index) {
                  final tr = transactions[index];
                  return Card(
                    elevation: 6,
                    margin: const EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FittedBox(
                            child: Text(
                              'R\$${tr.value}',
                              style: TextStyle(
                                  fontSize: 16 *
                                      MediaQuery.of(context).textScaleFactor),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(DateFormat('dd / MM / y').format(tr.date)),
                      trailing: MediaQuery.of(context).size.width > 480
                          ? TextButton.icon(
                              onPressed: () => onRemove(tr.id),
                              icon: const Icon(Icons.delete),
                              label: Text(
                                "Excluir",
                                style: TextStyle(
                                    color: Theme.of(context).errorColor),
                              ),
                            )
                          : IconButton(
                              onPressed: () => onRemove(tr.id),
                              icon: const Icon(Icons.delete),
                              color: Theme.of(context).errorColor,
                            ),
                    ),
                  );
                },
              ));
  }
}
