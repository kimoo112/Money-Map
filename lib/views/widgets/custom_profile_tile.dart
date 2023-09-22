import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../Helpers/colors.dart';

class CustomProfileTile extends StatelessWidget {
  const CustomProfileTile({
    super.key,
    this.onTap,
    required this.title,
    this.subtitle,
    required this.icon,
  });
  final void Function()? onTap;
  final IconData icon;
  final String title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: ListTile(
        leading: Icon(
          icon,
          color: cBlue,
        ),
        title: Text(
          title.toUpperCase(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          subtitle ?? '',
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
        trailing: const Icon(
          IconlyLight.arrowRight2,
          color: cBlue,
        ),
      ),
    );
  }
}
