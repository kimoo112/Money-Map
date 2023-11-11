import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../view model/transaction cubit/the_transaction_cubit.dart';

class TotalBalanceWidget extends StatelessWidget {
  const TotalBalanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Balance',
              style: TextStyle(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontSize: 16.sp,fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10.h),
            BlocBuilder<TheTransactionsCubit, TheTransactionsState>(
              builder: (context, state) {
                return Text(
                  "\$ ${BlocProvider.of<TheTransactionsCubit>(context).totalBalance}",
                  style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontSize: 16.sp,fontWeight: FontWeight.w600),
                );
              },
            ),
          ],
        ),
        Icon(
          Iconsax.activity5,
          color: Theme.of(context).scaffoldBackgroundColor,
          size: 20.sp,
        )
      ],
    );
  }
}
