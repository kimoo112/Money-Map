// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incomeandexpense/views/widgets/auth_state.dart';

import '../../Helpers/colors.dart';
import '../../Helpers/navigate.dart';
import '../../Helpers/size.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onTap,
    this.title,
    this.bcColor,
    this.padding,
    this.height,
  }) : super(key: key);
  final void Function()? onTap;
  final Widget? title;
  final Color? bcColor;
  final EdgeInsetsGeometry? padding;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap ??
            () {
              navigateToPR(const AuthStateChanges(), context);
            },
        child: Container(
            height: height ?? 50,
            width: kWidth(context),
            decoration: BoxDecoration(
               boxShadow: [
        BoxShadow(
          offset: const Offset(0, 2),
          color: cLightGrey.withOpacity(.5),
          blurRadius: 7,
          spreadRadius: .5,
        ),
      ],
              borderRadius: BorderRadius.circular(10.r),
              color: bcColor ?? Colors.amber,
            ),
            alignment: Alignment.center,
            child: title ??
                Text(
                  'Get Started !',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: cWhite),
                )),
      ),
    );
  }
}
