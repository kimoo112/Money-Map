import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Helpers/colors.dart';

class TransactionsRowWIdget extends StatelessWidget {
  const TransactionsRowWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Transactions History',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "See All",
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 12.sp, color: cBlue),
            ),
          ),
        ],
      ),
    );
  }
}
