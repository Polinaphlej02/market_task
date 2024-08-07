import 'package:flutter/material.dart';

import 'routing.dart';

class RouteScreen  extends StatelessWidget {
  const RouteScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}