import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../Helpers/colors.dart';
import '../../Helpers/navigate.dart';
import '../../view model/transaction cubit/the_transaction_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'base_screen.dart';

class AddTransactionsView extends StatefulWidget {
  const AddTransactionsView({Key? key}) : super(key: key);

  @override
  State<AddTransactionsView> createState() => _AddTransactionsViewState();
}

class _AddTransactionsViewState extends State<AddTransactionsView> {
  final now = DateTime.now();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final image = BlocProvider.of<TheTransactionsCubit>(context).imagePath;
    String formattedDate = DateFormat.yMd().format(now);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: cPrimaryDark,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16.r)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(33.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    BlocBuilder<TheTransactionsCubit, TheTransactionsState>(
                      builder: (context, state) {
                        if (state is TheImagePicked) {
                          return _transactionImage(state, context);
                        } else {}
                        return _transactionEmptyImage(image, context);
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomTextField(
                      controller: _amountController,
                      label: 'Amount'.toUpperCase(),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.name,
                      controller: _descriptionController,
                      label: "title".toUpperCase(),
                      isAmount: false,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    incomeRadio(context),
                    SizedBox(
                      height: 15.h,
                    ),
                    _addTransactionButton(context, formattedDate),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20.sp,
              left: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  IconlyBroken.arrowLeft2,
                  color: cPrimaryDark,
                  size: 18.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomButton _addTransactionButton(
      BuildContext context, String formattedDate) {
    return CustomButton(
      bcColor: cPrimaryDark,
      padding: EdgeInsets.zero,
      height: 30.h,
      title: Text(
        'Add transaction'.toUpperCase(),
        style: TextStyle(
            color: cWhite,
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
            letterSpacing: .8),
      ),
      onTap: () {
        if (_formKey.currentState!.validate()) {
          BlocProvider.of<TheTransactionsCubit>(context).addTransaction(
              _descriptionController.text,
              formattedDate.toString(),
              BlocProvider.of<TheTransactionsCubit>(context).imagePath,
              int.parse(_amountController.text));
          navigateToPR(const BaseScreen(), context);
        } else {}
      },
    );
  }

  Column incomeRadio(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio(
              activeColor: cGreen,
              value: true,
              groupValue:
                  BlocProvider.of<TheTransactionsCubit>(context).isIncome,
              onChanged: (val) {
                if (val != null) {
                  BlocProvider.of<TheTransactionsCubit>(context)
                      .updateIncomeChoice(val);
                  setState(() {});
                }
              }),
          title: Text('income'.toUpperCase()),
        ),
        ListTile(
          leading: Radio(
              activeColor: cRed,
              value: false,
              groupValue:
                  BlocProvider.of<TheTransactionsCubit>(context).isIncome,
              onChanged: (val) {
                if (val != null) {
                  BlocProvider.of<TheTransactionsCubit>(context)
                      .updateIncomeChoice(val);
                  setState(() {});
                }
              }),
          title: Text('expense'.toUpperCase()),
        ),
      ],
    );
  }

  Stack _transactionEmptyImage(String image, BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                49,
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  color: cLightGrey.withOpacity(.4),
                  blurRadius: 7,
                  spreadRadius: 1,
                ),
              ]),
          child: CircleAvatar(
              backgroundColor: cPrimaryDark,
              radius: 50,
              backgroundImage: image != '' ? FileImage(File(image)) : null),
        ),
        FloatingActionButton(
          backgroundColor: cWhite,
          shape: const CircleBorder(),
          mini: true,
          onPressed: () {
            BlocProvider.of<TheTransactionsCubit>(context)
                .pickImageFromGallery();
          },
          child: const Icon(
            Icons.add,
            color: cPrimaryDark,
          ),
        ),
      ],
    );
  }

  Stack _transactionImage(TheImagePicked state, BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                49,
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  color: cLightGrey.withOpacity(.4),
                  blurRadius: 7,
                  spreadRadius: 1,
                ),
              ]),
          child: CircleAvatar(
              backgroundColor: cPrimaryDark,
              radius: 50,
              backgroundImage: FileImage(File(state.imagePath))),
        ),
        FloatingActionButton(
          backgroundColor: cWhite,
          shape: const CircleBorder(),
          mini: true,
          onPressed: () {
            BlocProvider.of<TheTransactionsCubit>(context)
                .pickImageFromGallery();
          },
          child: const Icon(
            Icons.add,
            color: cPrimaryDark,
          ),
        ),
      ],
    );
  }
}
