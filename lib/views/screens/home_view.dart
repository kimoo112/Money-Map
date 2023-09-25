import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../Helpers/images.dart';
import '../../view model/transaction cubit/the_transaction_cubit.dart';
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
                return emptyList();
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
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
