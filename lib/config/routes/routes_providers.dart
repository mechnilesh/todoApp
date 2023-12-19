import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routes/routes.dart';

final routesProviders = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: navigationKey,
      initialLocation: RouteLocation.bottomBar,
      routes: appRoutes,
    );
  },
);
