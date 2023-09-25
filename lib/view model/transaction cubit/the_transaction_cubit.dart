// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incomeandexpense/Helpers/strings.dart';
import 'package:incomeandexpense/models/transactions_model.dart';

part 'the_transaction_state.dart';

class TheTransactionsCubit extends Cubit<TheTransactionsState> {
  num totalBalance = 0;
  final picker = ImagePicker();
  String imagePath = '';
  bool isIncome = true;
  num income = 0;
  num expenses = 0;
  List<TransactionsModel> transactionsContents = [];
  TheTransactionsCubit()
      : super(
          TheTransactionsInitial(),
        ) {
    initializeCubit();
  }
  void initializeCubit() async {
    var box = await Hive.openBox<TransactionsModel>(hiveBox);
    transactionsContents = box.values.toList();
    emit(TheTransactionsLoaded(transactions: transactionsContents));
    for (var transaction in transactionsContents) {
      incomeOrExpenseAdd(transaction);
    }
    emit(TheTransactionsLoaded(transactions: transactionsContents));
    checkList();
  }

  void computeIncomeAndExpense(TransactionsModel transaction) {
    if (transaction.isIncome) {
      income += transaction.price;
      totalBalance += transaction.price;
    } else {
      expenses += transaction.price;
      totalBalance -= transaction.price;
    }
  }

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

  removeBox() async {
    var box = await Hive.openBox<TransactionsModel>(hiveBox);
    box.clear();
    transactionsContents.clear();
    income = 0;
    expenses = 0;
    totalBalance = 0;
    emit(TheTransactionsEmpty());

    // emit(TheAllTransactionsRemoved());
  }

  incomeOrExpenseAdd(TransactionsModel transactions) {
    if (transactions.isIncome) {
      totalBalance += transactions.price;
      income += transactions.price;
      emit(IsIncomeState());
    } else {
      totalBalance -= transactions.price;
      expenses += transactions.price;
      emit(IsExpenseState());
    }
  }

  incomeOrExpenseRemove(TransactionsModel transaction) {
    if (transaction.isIncome == true) {
      totalBalance -= transaction.price;
      income -= transaction.price;
      emit(IsIncomeState());
    } else {
      totalBalance += transaction.price;
      expenses -= transaction.price;
      emit(IsExpenseState());
    }
  }

  addTransaction(title, date, image, price) async {
    emit(TheTransactionsEmpty());
    var box = await Hive.openBox<TransactionsModel>(hiveBox);
    final transaction = TransactionsModel(
        title: title,
        date: date,
        price: price,
        image: image,
        isIncome: isIncome);
    addTOCollection(title, date, image, price);
    box.add(transaction);
    transactionsContents = box.values.toList(); // Update the list after adding
    image = imagePath;
    incomeOrExpenseAdd(transaction);
    emit(TheTransactionsLoaded(transactions: transactionsContents));
    checkList();
    imagePath = '';
  }

  Future addTOCollection(title, date, image, price) async {
    CollectionReference transactions =
        FirebaseFirestore.instance.collection('transactions');
    return transactions
        .add({'image': image, 'price': price, 'title': title, 'date': date})
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }

  removeTransaction(TransactionsModel transaction) async {
    var box = await Hive.openBox<TransactionsModel>(hiveBox);
    int? keyForDeletion;
    for (var key in box.keys) {
      var storedTransaction = box.get(key);
      if (storedTransaction == transaction) {
        keyForDeletion = key;
        break;
      }
    }
    if (keyForDeletion != null) {
      box.delete(keyForDeletion);
    }
    transactionsContents =
        box.values.toList(); // Update the list after deletion
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
