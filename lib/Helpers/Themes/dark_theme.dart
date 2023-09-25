import 'package:flutter/material.dart';

import '../colors.dart';

ThemeData customDarkTheme(context) => ThemeData.dark(
      useMaterial3: true,
    ).copyWith(
        primaryColor: cBlue,
        scaffoldBackgroundColor: cDark,
        textTheme: Theme.of(context)
            .textTheme
            .apply(fontFamily: 'Inter', bodyColor: cLight));
