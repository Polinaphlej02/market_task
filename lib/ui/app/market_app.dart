import 'package:flutter/material.dart';
import 'package:market_task/theme/styles.dart';

import '../auth/auth_screen.dart';

class MarketApp extends StatelessWidget {
  const MarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: marketTheme(),
      home: AuthScreen(),
    );
  }
}