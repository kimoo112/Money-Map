import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:incomeandexpense/view%20model/google%20auth%20cubit/google_auth_cubit.dart';
import 'package:incomeandexpense/views/screens/base_screen.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../Helpers/navigate.dart';
import '../../Helpers/strings.dart';
import '../screens/add_transactions.dart';
import 'custom_profile_tile.dart';

class AllProfileListTiles extends StatelessWidget {
  const AllProfileListTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomProfileTile(
          icon: Iconsax.global,
          title: 'Go To Our Website',
          subtitle: 'Explore more about our services',
          onTap: () {
            _launchUrl('https://my-moneyy.vercel.app/');
          },
        ),
        SizedBox(
          height: 5.h,
        ),
        Divider(
          indent: 30.w,
          endIndent: 30.w,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomProfileTile(
          icon: Iconsax.money_add,
          title: 'Add Transaction',
          subtitle: 'Update your balance with every transaction',
          onTap: () {
            navigateToP(const AddTransactionsView(), context);
          },
        ),
        CustomProfileTile(
          icon: Ionicons.bar_chart_outline,
          title: 'Explore Your Charts',
          subtitle: 'Visualize your financial charts for informed decisions',
          onTap: () {
            navigateToPR(
                const BaseScreen(
                  bottomNavIndex: 1,
                ),
                context);
          },
        ),
        CustomProfileTile(
          icon: Iconsax.message,
          title: 'Contact Me',
          subtitle: 'Tap to start a WhatsApp chat',
          onTap: () {
            _launchUrl(whatsappUrl);
          },
        ),
        CustomProfileTile(
          icon: Ionicons.logo_github,
          title: 'Discover My GitHub',
          subtitle: 'Explore Repos , See latest Commits contribute to my Vision',
          onTap: () {
            _launchUrl(githubUrl);
          },
        ),
        CustomProfileTile(
          icon: Iconsax.logout,
          title: 'Logout',
          subtitle: 'Securely sign out from your account',
          onTap: () {
            BlocProvider.of<GoogleAuthCubit>(context).signout(context);
          },
        ),
      ],
    );
  }
}

Future<void> _launchUrl(String url) async {
  if (await canLaunchUrlString(url)) {
    launchUrlString(url);
  } else {
    throw Exception('Could not launch $url');
  }
}
