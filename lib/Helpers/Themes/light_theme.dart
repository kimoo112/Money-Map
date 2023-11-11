import 'package:flutter/material.dart';

import '../colors.dart';

ThemeData customLightTheme(context) => ThemeData.light(
      useMaterial3: true,
    ).copyWith(
        primaryColor: cPrimaryLight,
        scaffoldBackgroundColor: cLight,
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(backgroundColor: cLight),
        textTheme: Theme.of(context)
            .textTheme
            .apply(fontFamily: 'Inter', bodyColor: cDark));
