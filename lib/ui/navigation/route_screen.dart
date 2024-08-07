import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteScreen  extends StatelessWidget {
  const RouteScreen ({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: _buidBottomNavigationItems,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex
        ),
        ),
    );
  }
}

List<BottomNavigationBarItem> get _buidBottomNavigationItems => [
  const BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Profile'
    ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    label: 'Prodacts'
    ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.favorite),
    label: 'Favorite'
    )
];