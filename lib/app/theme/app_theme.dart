import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeDataFactory {
  static ThemeData prepareThemeData() => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        accentColor: AppColors.textPrimary,
        backgroundColor: Colors.white,
        fontFamily: 'Lato',
        scaffoldBackgroundColor: Colors.white,
      );
}
