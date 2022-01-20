import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  const Transaction({
    Key? key,
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// class Transaction {
//   final String id;
//   final String title;
//   final double value;
//   final DateTime date;

//   Transaction(
//       {required this.id,
//       required this.title,
//       required this.value,
//       required this.date});
// }
