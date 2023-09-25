import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

import '../../view model/transaction cubit/the_transaction_cubit.dart';

class ExpensesWidget extends StatelessWidget {
  const ExpensesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Expenses'.toUpperCase(),
              style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: 16.sp),
            ),
            SizedBox(width: 10.w),
            Icon(
              Ionicons.trending_down_outline,
              size: 20.sp,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ],
        ),
        SizedBox(height: 5.h),
        BlocBuilder<TheTransactionsCubit, TheTransactionsState>(
          builder: (context, state) {
            return Text(
              "\$ ${BlocProvider.of<TheTransactionsCubit>(context).expenses}",
              style: TextStyle(
                                    color: Theme.of(context).scaffoldBackgroundColor,
fontSize: 16.sp),
            );
          },
        )
      ],
    );
  }
}
