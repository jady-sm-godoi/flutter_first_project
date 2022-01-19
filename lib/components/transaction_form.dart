import 'package:flutter/material.dart';
import 'adaptative_button.dart';
import 'adaptative_textfield.dart';
import 'adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    _onSubmit() {
      final title = _titleController.text;
      final value = double.tryParse(_valueController.text) ?? 0.0;

      if (title.isEmpty || value <= 0) {
        return;
      }

      widget.onSubmit(title, value, _selectedDate);
    }

    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptativeTextfield(
                controller: _titleController,
                onSubmitted: (_) => _onSubmit(),
                label: 'Título',
              ),
              // TextField(
              //   controller: _titleController,
              //   onSubmitted: (_) => _onSubmit(),
              //   decoration: InputDecoration(labelText: 'Título'),
              // ),
              AdaptativeTextfield(
                controller: _valueController,
                keyboardType: const TextInputType.numberWithOptions(),
                onSubmitted: (_) => _onSubmit(),
                label: 'Valor (R\$)',
              ),
              // TextField(
              //   controller: _valueController,
              //   keyboardType: TextInputType.numberWithOptions(),
              //   onSubmitted: (_) => _onSubmit(),
              //   decoration: InputDecoration(labelText: 'Valor (R\$)'),
              // ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              // Container(
              //   height: 70,
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Text(_selectedDate == null
              //             ? 'Nenhuma data selecionada!'
              //             : 'Data: ${DateFormat('dd/MM/y').format(_selectedDate)}'),
              //       ),
              //       TextButton(
              //         onPressed: _showDatePicker,
              //         child: Text('Selecionar Data'),
              //       )
              //     ],
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                    label: 'Nova transação',
                    onPressed: _onSubmit,
                  )

                  // ElevatedButton(
                  //   onPressed: _onSubmit,
                  //   child: const Text('Nova transação'),
                  //   style: ButtonStyle(
                  //     backgroundColor:
                  //         MaterialStateProperty.all<Color>(Colors.red),
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
