import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incomeandexpense/Helpers/colors.dart';
import 'package:incomeandexpense/Helpers/images.dart';
import 'package:incomeandexpense/view%20model/theme%20cubit/theme_cubit.dart';
import 'package:incomeandexpense/views/screens/get_started_view.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    
        return FlutterSplashScreen.scale(
          backgroundColor:cDarkBlue,
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
