import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Helpers/colors.dart';
import '../../Helpers/size.dart';
import '../../view model/cubit/the_money_cubit.dart';
import 'expenses_widget.dart';
import 'income_widget.dart';
import 'total_balance_widget.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Container(
          height: 201.99.h,
          width: kWidth(context),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: cGrey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 11,
                  offset: const Offset(0, 3), // Changes position of shadow
                ),
              ],
              color: cBlue.withOpacity(.88),
              borderRadius: BorderRadius.circular(22.r)),
          child: Padding(
            padding: EdgeInsets.all(12.0.sp),
            child:
                 BlocBuilder<TheTransactionsCubit, TheTransactionsState>(
              builder: (context, state) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TotalBalanceWidget(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IncomeWidget(),
                        ExpensesWidget(),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
