// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incomeandexpense/models/transactions_model.dart';
import 'package:meta/meta.dart';

part 'the_money_state.dart';

class TheTransactionsCubit extends Cubit<TheTransactionsState> {
  num totalBalance = 0;
  final picker = ImagePicker();
  String imagePath = '';

  num income = 0;
  num expenses = 0;
  List<TransactionsModel> transactionsContents = [];
  TheTransactionsCubit() : super(TheTransactionsInitial());
  checkList() {
    if (transactionsContents.isEmpty) {
      emit(TheTransactionsEmpty());
    } else {
      emit(TheTransactionsLoaded(transactions: transactionsContents));
    }
  }

  addTransaction(title, date, image, price) {
    emit(TheTransactionsEmpty());

    final transaction =
        TransactionsModel(title: title, date: date, price: price, image: image);
    transactionsContents.add(transaction);
    image = imagePath;
    totalBalance += price;
    income += price;
    emit(TheTransactionsLoaded(transactions: transactionsContents));
    checkList();

  }

  removeTransaction(TransactionsModel transaction) {
    transactionsContents.remove(transaction);
    totalBalance -= transaction.price;
    income -= transaction.price;
    emit(TheTransactionsRemoved());
    checkList();
  }

  Future<void> pickImageFromGallery() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        imagePath = pickedFile.path;
      } else {}
      // ignore: empty_catches
    } catch (e) {}
  }
}
