import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../../Helpers/colors.dart';
import '../../models/transactions_model.dart';
import '../../view model/transaction cubit/the_transaction_cubit.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        background: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: cRed, borderRadius: BorderRadius.circular(11)),
          alignment: Alignment.centerLeft,
          child: const Icon(
            Ionicons.trash,
            color: cWhite,
          ),
        ),
        key: UniqueKey(),
        onDismissed: (direction) {
          BlocProvider.of<TheTransactionsCubit>(context)
              .removeTransaction(transactionsContents[index]);
        },
        child: ListTile(
          title: Text(transactionsContents[index].title),
          subtitle: Text(transactionsContents[index].date),
          leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              backgroundImage: transactionsContents[index].image != null
                  ? FileImage(File(transactionsContents[index].image))
                  : null),
          trailing: Text('\$ ${transactionsContents[index].price}',
              style: TextStyle(
                  fontSize: 15,
                  color: transactionsContents[index].isIncome ? cGreen : cRed)),
        ),
      ),
    );
  }
}
