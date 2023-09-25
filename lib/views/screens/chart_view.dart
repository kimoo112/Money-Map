import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/balance_chart.dart';

class ChartView extends StatelessWidget {
  const ChartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BalanceChart(),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'A Clear Look at Your Earnings and Spendings 💸',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
