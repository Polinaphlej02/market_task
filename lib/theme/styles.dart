import 'package:flutter/material.dart';
import 'package:market_task/theme/consts.dart';

ThemeData marketTheme() => ThemeData(
  primaryColor: MarketColors.main,
  navigationBarTheme: const NavigationBarThemeData(backgroundColor: MarketColors.navigation)
);