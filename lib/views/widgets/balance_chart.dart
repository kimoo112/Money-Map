import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Helpers/colors.dart';
import '../../view model/transaction cubit/the_transaction_cubit.dart';

class BalanceChart extends StatefulWidget {
  const BalanceChart({super.key});

  @override
  State<BalanceChart> createState() => _BalanceChartState();
}

class _BalanceChartState extends State<BalanceChart> {
  @override
  Widget build(BuildContext context) {
    double income =
        BlocProvider.of<TheTransactionsCubit>(context).income.toDouble();
    double expense =
        BlocProvider.of<TheTransactionsCubit>(context).expenses.toDouble();
    double totalBalance =
        BlocProvider.of<TheTransactionsCubit>(context).totalBalance.toDouble();

    return AspectRatio(
      aspectRatio: 1.2,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BarChart(
            BarChartData(
              backgroundColor: cDark.withOpacity(.04),
              alignment: BarChartAlignment.spaceAround,
              maxY: [income, expense, totalBalance]
                      .reduce((curr, next) => curr > next ? curr : next) *
                  1.2, // Ensure the bars fit within the chart
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Theme.of(context).primaryColor,
                  tooltipRoundedRadius: 15,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    String title;
                    switch (group.x.toInt()) {
                      case 0:
                        title = 'Income';
                        break;
                      case 1:
                        title = 'Expense';
                        break;
                      case 2:
                        title = 'Balance';
                        break;
                      default:
                        throw Exception('Unknown x value');
                    }
                    return BarTooltipItem(
                      '$title\n${rod.toY}',
                      const TextStyle(color: Colors.white),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(sideTitles: SideTitles(
                    getTitlesWidget: (double value, _) {
                      switch (value.toInt()) {
                        case 0:
                          return const Text('Income');
                        case 1:
                          return const Text('Expense');
                        case 2:
                          return const Text('Total Balance');
                        default:
                          return const Text('');
                      }
                    },
                  ))),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      toY: income,
                      color: cGreen,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(
                      toY: expense,
                      color: cRed,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(
                      toY: totalBalance,
                      color: cBlue,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
