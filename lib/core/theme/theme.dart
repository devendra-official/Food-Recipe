import 'package:flutter/material.dart';
import 'package:food_receipe/core/theme/app_pallete.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppPallete.appTheme),
  useMaterial3: true,
  checkboxTheme: const CheckboxThemeData(
    side: BorderSide(color: AppPallete.checkBoxBorder)
  )
);
