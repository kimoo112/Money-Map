import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileTile extends StatelessWidget {
  const CustomProfileTile({
    super.key,
    this.onTap,
    required this.title,
    this.subtitle,
    required this.icon, this.trailing,
  });
  final void Function()? onTap;
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          title.toUpperCase(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding:  EdgeInsets.only(top:4.0.sp),
          child: Text(
            subtitle ?? '',
            style: const TextStyle(fontWeight: FontWeight.w400,),
          ),
        ),
        trailing:trailing ?? Icon(
          IconlyLight.arrowRight2,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
