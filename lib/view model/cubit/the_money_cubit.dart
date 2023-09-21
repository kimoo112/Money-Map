// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incomeandexpense/models/transactions_model.dart';

part 'the_money_state.dart';

class TheTransactionsCubit extends Cubit<TheTransactionsState> {
  num totalBalance = 0;
  final picker = ImagePicker();
  String imagePath = '';
  bool isIncome = true;
  num income = 0;
  num expenses = 0;
  List<TransactionsModel> transactionsContents = [];
  TheTransactionsCubit() : super(TheTransactionsInitial());

  void updateIncomeChoice(bool? isIncomeChoice) {
    if (isIncomeChoice != null) {
      isIncome = isIncomeChoice;
      emit(IsIncomeStateUpdated());
    }
  }

  checkList() {
    if (transactionsContents.isEmpty) {
      emit(TheTransactionsEmpty());
    } else {
      emit(TheTransactionsLoaded(transactions: transactionsContents));
    }
  }

  incomeOrExpenseAdd(price) {
    if (isIncome) {
      totalBalance += price;
      income += price;
      emit(IsIncomeState());
    } else {
      totalBalance -= price;
      expenses += price;
      emit(IsExpenseState());
    }
  }

  incomeOrExpenseRemove(TransactionsModel transaction) {
    if (transaction.isIncome ==true) {
      totalBalance -= transaction.price;
      income -= transaction.price;
      emit(IsIncomeState());
    } else {
      totalBalance += transaction.price;
      expenses -= transaction.price;
      emit(IsExpenseState());
    }
  }

  addTransaction(title, date, image, price) {
    emit(TheTransactionsEmpty());

    final transaction = TransactionsModel(
        title: title,
        date: date,
        price: price,
        image: image,
        isIncome: isIncome);
    transactionsContents.add(transaction);
    image = imagePath;
    incomeOrExpenseAdd(price);
    emit(TheTransactionsLoaded(transactions: transactionsContents));
    checkList();
    imagePath = '';
  }

  removeTransaction(TransactionsModel transaction) {
    transactionsContents.remove(transaction);
    incomeOrExpenseRemove(transaction);
    emit(TheTransactionsRemoved());
    checkList();
  }

  Future<void> pickImageFromGallery() async {
    emit(TheImageEmpty());
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        imagePath = pickedFile.path;
        emit(TheImagePicked(imagePath: imagePath));
      } else {}
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
