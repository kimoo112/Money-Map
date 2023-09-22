import 'package:hive/hive.dart';
part 'transactions_model.g.dart';

@HiveType(typeId: 0)
class TransactionsModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final int price;
  @HiveField(3)
  final dynamic image;
  @HiveField(4)
  late final bool isIncome;
  TransactionsModel({
    required this.title,
    required this.date,
    required this.price,
    required this.image,
    required this.isIncome,
  });
}
