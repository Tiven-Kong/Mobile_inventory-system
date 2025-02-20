


import 'package:flutter/material.dart';

import 'colors_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primarycolor,
    colorScheme: ColorScheme.light(

    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: AppColors.whitecolor),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 16),

    ),
  );
}

