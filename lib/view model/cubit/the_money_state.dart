part of 'the_money_cubit.dart';

@immutable
sealed class TheTransactionsState {}

final class TheTransactionsInitial extends TheTransactionsState {}

final class TheTransactionsEmpty extends TheTransactionsState {}

final class TheTransactionsLoaded extends TheTransactionsState {
  final List<TransactionsModel> transactions;

  TheTransactionsLoaded({required this.transactions});
}

final class TheTransactionsRemoved extends TheTransactionsState {}

final class TheImagePicked extends TheTransactionsState {
  final String imagePath;

  TheImagePicked({required this.imagePath});
}

final class TheImageEmpty extends TheTransactionsState {}
final class IsIncomeState extends TheTransactionsState {}
final class IsIncomeStateUpdated extends TheTransactionsState {}
final class IsExpenseState extends TheTransactionsState {}
