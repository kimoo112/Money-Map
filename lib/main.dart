import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:incomeandexpense/Helpers/colors.dart';
import 'package:incomeandexpense/view%20model/theme%20cubit/theme_cubit.dart';

import 'Helpers/Themes/dark_theme.dart';
import 'Helpers/Themes/light_theme.dart';
import 'Helpers/strings.dart';
import 'firebase_options.dart';
import 'models/transactions_model.dart';
import 'view model/google auth cubit/google_auth_cubit.dart';
import 'view model/transaction cubit/the_transaction_cubit.dart';
import 'views/screens/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionsModelAdapter());
  await Hive.openBox<TransactionsModel>(hiveBox);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: cPrimaryDark,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MoneyMap());
}

class MoneyMap extends StatelessWidget {
  const MoneyMap({super.key});

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
                create: (context) => ThemeCubit()..getTheme(),
              ),
              BlocProvider(
                create: (context) => GoogleAuthCubit(),
              ),
              BlocProvider(
                create: (context) => TheTransactionsCubit(),
              ),
            ],
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                ThemeMode themeMode;
                if (state is DarkTheme) {
                  themeMode = ThemeMode.dark;
                } else if (state is LightTheme) {
                  themeMode = ThemeMode.light;
                } else {
                  themeMode = ThemeMode.system;
                }
                return MaterialApp(
                  title: 'Money Map',
                  debugShowCheckedModeBanner: false,
                  themeMode: themeMode,
                  darkTheme: customDarkTheme(context),
                  theme: customLightTheme(context),
                  home: const SplashView(),
                );
              },
            ),
          );
        });
  }
}
