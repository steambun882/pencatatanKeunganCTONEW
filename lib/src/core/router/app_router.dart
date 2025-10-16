import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: HomeRoute.path,
        name: HomeRoute.name,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
});

abstract class HomeRoute {
  static const path = '/';
  static const name = 'home';
}
