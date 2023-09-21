// ignore_for_file: public_member_api_docs, sort_constructors_first

class TransactionsModel {
  final String title;
  final String date;
  final int price;
  final dynamic image;
  final bool isIncome;
  TransactionsModel({
    required this.title,
    required this.date,
    required this.price,
    required this.image,
    required this.isIncome,
  });
}
