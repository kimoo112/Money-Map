import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incomeandexpense/Helpers/images.dart';
import 'package:incomeandexpense/view%20model/cubit/the_money_cubit.dart';
import 'package:lottie/lottie.dart';

import '../../Helpers/colors.dart';
import '../widgets/bottom_container.dart';
import '../widgets/top_container.dart';
import '../widgets/transaction_container.dart';
import '../widgets/transactions_row_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TheTransactionsCubit>(context).checkList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350.h,
              child: const Stack(
                children: [
                  TopContainer(),
                  BottomContainer(),
                ],
              ),
            ),
            const TransactionsRowWIdget(),
            BlocBuilder<TheTransactionsCubit, TheTransactionsState>(
              builder: (context, state) {
                if (state is TheTransactionsEmpty) {
                  return emptyList();
                } else if (state is TheTransactionsLoaded) {
                  return Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.transactions.length,
                    itemBuilder: (BuildContext context, int index) {
                      final transactionsContents =
                          state.transactions.reversed.toList();
                      return TranasactionContainer(
                          transactionsContents: transactionsContents,
                          index: index);
                    },
                  ));
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }

  Column emptyList() {
    return Column(
      children: [
        Lottie.asset(Assets.images404Lottie,
            width: 250.w,
            animate: true,
            options: LottieOptions(enableMergePaths: true)),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Your financial story begins now! Add your first transaction Now 📖💰'
              .toUpperCase(),
          style: TextStyle(
              color: cBlue, fontWeight: FontWeight.w600, fontSize: 14.sp),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
