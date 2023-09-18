import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Helpers/colors.dart';

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
              style: TextStyle(color: cLight, fontSize: 16.sp),
            ),
            SizedBox(width: 10.w),
             Icon(Icons.arrow_circle_down_rounded,size: 18.sp,),
          ],
        ),
        SizedBox(height: 5.h),
        Text(
          '\$ 500',
          style: TextStyle(color: cLight, fontSize: 16.sp),
        ),
      ],
    );
  }
}
