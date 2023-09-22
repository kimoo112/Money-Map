import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incomeandexpense/view%20model/cubit/the_money_cubit.dart';
import 'package:incomeandexpense/views/screens/base_screen.dart';

import 'firebase_options.dart';
import 'view%20model/google%20auth%20cubit/google_auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GoogleAuthCubit(),
              ),
              BlocProvider(
                create: (context) => TheTransactionsCubit(),
              ),
            ],
            child: MaterialApp(
              title: 'Money Map',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'Inter',
                useMaterial3: true,
              ),
              home: const BaseScreen(),
            ),
          );
        });
  }
}
