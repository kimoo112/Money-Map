import 'package:flutter/material.dart';

import '../colors.dart';

ThemeData customDarkTheme(context) => ThemeData.dark(
      useMaterial3: true,
    ).copyWith(
        primaryColor: cPrimaryDark,
        scaffoldBackgroundColor: cDark,
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(backgroundColor: cBottomNav),
        textTheme: Theme.of(context)
            .textTheme
            .apply(fontFamily: 'Inter', bodyColor: cLight));
