import 'package:flutter/material.dart';
import 'package:market_task/theme/styles.dart';
import 'package:market_task/ui/navigation/routing.dart';



class MarketApp extends StatelessWidget {
  const MarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: marketTheme(),
      routerConfig: router,
    );
  }
}