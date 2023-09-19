import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incomeandexpense/view%20model/cubit/the_money_cubit.dart';

import '../../Helpers/colors.dart';

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
              style: TextStyle(color: cLight, fontSize: 16.sp),
            ),
            SizedBox(height: 10.h),
            BlocBuilder<TheTransactionsCubit, TheTransactionsState>(
              builder: (context, state) {
                return Text(
                  "\$ ${BlocProvider.of<TheTransactionsCubit>(context).totalBalance}",
                  style: TextStyle(color: cLight, fontSize: 16.sp),
                );
              },
            ),
          ],
        ),
        const Icon(CupertinoIcons.chart_bar_alt_fill)
      ],
    );
  }
}
