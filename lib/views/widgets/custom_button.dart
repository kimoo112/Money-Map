import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Helpers/colors.dart';
import '../../Helpers/navigate.dart';
import '../../Helpers/size.dart';
import '../screens/login_view.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.title,
    this.bcColor,
  });
  final void Function()? onTap;
  final Widget? title;
  final Color? bcColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap ??
            () {
              navigateToPR(const LoginView(), context);
            },
        child: Container(
            height: 50,
            width: kWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: bcColor ?? Colors.amber,
            ),
            alignment: Alignment.center,
            child: title ??
                 Text(
                  'Get Started !',
                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500,color: cWhite),
                )),
      ),
    );
  }
}
