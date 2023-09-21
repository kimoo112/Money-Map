import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incomeandexpense/models/transactions_model.dart';
import 'package:incomeandexpense/view%20model/cubit/the_money_cubit.dart';

import '../../Helpers/colors.dart';

class TranasactionContainer extends StatelessWidget {
  const TranasactionContainer({
    super.key,
    required this.transactionsContents,
    required this.index,
  });

  final List<TransactionsModel> transactionsContents;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        BlocProvider.of<TheTransactionsCubit>(context)
            .removeTransaction(transactionsContents[index]);
      },
      child: ListTile(
        title: Text(transactionsContents[index].title),
        subtitle: Text(transactionsContents[index].date),
        leading: CircleAvatar(
            backgroundColor: cBlue,
            backgroundImage: transactionsContents[index].image != null
                ? FileImage(File(transactionsContents[index].image))
                : null),
        trailing: Text('\$ ${transactionsContents[index].price}',
            style: TextStyle(
                fontSize: 15,
                color: transactionsContents[index].isIncome ? cGreen : cRed)),
      ),
    );
  }
}
