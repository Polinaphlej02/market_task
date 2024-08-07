import 'package:go_router/go_router.dart';
import 'package:market_task/ui/auth/auth_screen.dart';
import 'package:market_task/ui/favorite/favorite_screen.dart';
import 'package:market_task/ui/profile/profile_screen.dart';

import '../cards/cards_screen.dart';

final router = GoRouter(
  initialLocation: 'auth',
  routes: [
  ShellRoute(routes: [
    GoRoute(path: '/cards', builder: (context, state) => const CardsScreen()),
    GoRoute(
        path: '/profile', builder: (context, state) => const ProfileScreen()),
    GoRoute(
        path: '/favorite', builder: (context, state) => const FavoriteScreen())
  ]),
  GoRoute(path: '/auth', builder: (context, state) => const AuthScreen()),
]);
