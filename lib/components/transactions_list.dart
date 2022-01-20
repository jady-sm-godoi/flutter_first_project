import 'package:flutter/material.dart';
import 'package:udemy_expenses/models/transaction.dart';
import 'transaction_item.dart';

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
            : ListView(
                children: transactions
                    .map((tr) => TransactionItem(
                          key: ValueKey(tr.id),
                          tr: tr,
                          onRemove: onRemove,
                        ))
                    .toList(),
              )
        // : ListView.builder(
        //     itemCount: transactions.length,
        //     itemBuilder: (ctex, index) {
        //       final tr = transactions[index];
        //       return TransactionItem(
        //         key: GlobalObjectKey(tr),
        //         tr: tr,
        //         onRemove: onRemove,
        //       );
        //     },
        //   ),
        );
  }
}
