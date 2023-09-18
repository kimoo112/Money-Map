import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            Text(
              '\$ 2,548.00',
              style: TextStyle(color: cLight, fontSize: 16.sp),
            ),
          ],
        ),
        const Icon(Icons.directions_transit_sharp)
      ],
    );
  }
}
