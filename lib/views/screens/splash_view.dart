import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Helpers/colors.dart';
import '../../Helpers/images.dart';
import 'get_started_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      backgroundColor: cNavy,
      duration: const Duration(seconds: 3),
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(Assets.imagesSpalshLottie),
        ],
      ),
      defaultNextScreen: const GetStartedView(),
    );
  }
}
