import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Helpers/colors.dart';
import 'home_view.dart';
import 'login_view.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  List screens = [
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const LoginView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.pinned,
        backgroundColor: cBlue,
        snakeShape: SnakeShape.circle,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shape: ShapeBorder.lerp(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
            22),
        snakeViewColor: cDark,
        selectedItemColor: cLight,
        unselectedItemColor: cDark,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBold.home,
                size: 22.sp,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBold.chart,
                size: 22.sp,
              ),
              label: 'Chart'),
          const BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.wallet,
                size: 20,
              ),
              label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBold.profile,
                size: 22.sp,
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
