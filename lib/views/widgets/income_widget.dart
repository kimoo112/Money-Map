import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Helpers/colors.dart';
import '../../view model/transaction cubit/the_transaction_cubit.dart';

class IncomeWidget extends StatelessWidget {
  const IncomeWidget({
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
              'income'.toUpperCase(),
              style: TextStyle(color: cLight, fontSize: 16.sp),
            ),
            SizedBox(width: 10.w),
            Icon(
              Icons.arrow_circle_up,
              size: 18.sp,
            ),
          ],
        ),
        SizedBox(height: 5.h),
        BlocBuilder<TheTransactionsCubit, TheTransactionsState>(
          builder: (context, state) {
            return Text(
              "\$ ${BlocProvider.of<TheTransactionsCubit>(context).income}",
              style: TextStyle(color: cLight, fontSize: 16.sp),
            );
          },
        ),
      ],
    );
  }
}
