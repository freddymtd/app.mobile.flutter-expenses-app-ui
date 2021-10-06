import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  DateTime _date;

  String getText() {
    if (_date == null) {
      return 'Select Date';
    } else {
      return DateFormat('dd/MM/yyyy').format(_date);
    }
  }

  void submitDate() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    final enteredDate = DateTime.parse(_dateController.text);
    //DateTime dt = DateTime.parse('$enteredDate');
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    } else {
      widget.addTx(enteredTitle, enteredAmount, enteredDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                  helperText: 'Required',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6200EE)),
                  ),
                ),
                onSubmitted: (_) => submitDate,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                  helperText: 'Required',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6200EE)),
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                onSubmitted: (_) => submitDate,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6200EE)),
                  ),
                  hintText: getText(),
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: Color(0xFF6200EE),
                  ),
                ),
                onTap: () => pickDate(context),
              ),
              ElevatedButton(
                onPressed: () {
                  submitDate();
                },
                child: Text('Adicionar'),
              ),
            ],
          )),
      elevation: 5,
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: _date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    ).then((selectedDate) {
      if (selectedDate != null) {
        _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      }
    });

    if (newDate == null) return;

    setState(() => _date = newDate);
  }
}
