import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../Helpers/navigate.dart';
import '../../Helpers/strings.dart';
import '../../view model/google auth cubit/google_auth_cubit.dart';
import '../../view model/theme cubit/theme_cubit.dart';
import '../screens/add_transactions.dart';
import '../screens/base_screen.dart';
import 'custom_profile_tile.dart';
import 'custom_switch_tile.dart';
import 'dark_light_switcher.dart';

class AllProfileListTiles extends StatefulWidget {
  const AllProfileListTiles({
    super.key,
  });

  @override
  State<AllProfileListTiles> createState() => _AllProfileListTilesState();
}

class _AllProfileListTilesState extends State<AllProfileListTiles> {
  bool isAllowed = true;

  void saveSwitchValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('switch', isAllowed);
    getSwitchValue();
  }

  getSwitchValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.get('switch') != null) {
      isAllowed = prefs.getBool('switch')!;
      setState(() {});
    } else {
      debugPrint('Switch value');
    }
  }

  @override
  void initState() {
    super.initState();
    getSwitchValue();
  }

  @override
  Widget build(BuildContext context) {
    var themeCubit = BlocProvider.of<ThemeCubit>(context);
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
        CustomSwitchTile(
            isAllowed: isAllowed,
            leadingIcon: IconlyLight.notification,
            enabledSubtitle: 'You\'ll receive updates and alerts',
            title: 'App Notification',
            onChanged: (p0) {
              isAllowed = !isAllowed;
              saveSwitchValue();
              setState(() {});
            },
            desabledSubtitle: 'You won\'t receive updates and alerts'),
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return CustomProfileTile(
              icon: themeCubit.isDarkTheme?Ionicons.moon_outline:Ionicons.sunny_outline,
              title: 'Theme Preferences',
              subtitle: themeCubit.isDarkTheme
                  ? 'Dark Mode Activated: Gentle for Your eyes '
                  : 'Light Mode Activated: Clear For Daytime Viewing',
              trailing: DayNightSwitch(
                value: themeCubit.isDarkTheme,
                onChanged: (_) {
                  themeCubit.changeTheme();
                },
              ),
            );
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
          subtitle: 'Explore My Repos , See latest Commits ',
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
        SizedBox(
          height: 55.h,
        )
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
