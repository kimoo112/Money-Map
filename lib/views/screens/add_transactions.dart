import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incomeandexpense/Helpers/colors.dart';
import 'package:incomeandexpense/Helpers/navigate.dart';
import 'package:incomeandexpense/view%20model/cubit/the_money_cubit.dart';
import 'package:incomeandexpense/views/screens/base_screen.dart';
import 'package:intl/intl.dart';

class AddTransactionsView extends StatefulWidget {
  const AddTransactionsView({Key? key}) : super(key: key);

  @override
  State<AddTransactionsView> createState() => _AddTransactionsViewState();
}

class _AddTransactionsViewState extends State<AddTransactionsView> {
  bool _isIncome = true;
  final now = DateTime.now();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMd().format(now);

    return Scaffold(
      backgroundColor: cBlue,
      // appBar: AppBar(
      //   title: const Text('Screen'),
      // ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: cWhite, borderRadius: BorderRadius.circular(16.r)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CheckboxListTile(
                title: _isIncome ? Text('Income') : Text('Expense'),
                value: _isIncome,
                onChanged: (value) {
                  setState(() {
                    _isIncome = !_isIncome;
                  });
                },
              ),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
              ),

              // Description text field
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: BlocBuilder<TheTransactionsCubit, TheTransactionsState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<TheTransactionsCubit>(context)
                            .addTransaction(
                                _descriptionController.text,
                                formattedDate.toString(),
                                BlocProvider.of<TheTransactionsCubit>(context)
                                    .imagePath,
                                int.parse(_amountController.text));
                        navigateToPR(const BaseScreen(), context);
                      },
                      child: const Text('Add transaction'),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<TheTransactionsCubit>(context)
                      .pickImageFromGallery();
                },
                child: const Text('Add Image'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
