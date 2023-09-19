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
