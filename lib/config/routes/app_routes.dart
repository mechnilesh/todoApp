import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/app/app_botto_bar.dart';
import 'package:todoapp/screens/screen.dart';
import 'route_location.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteLocation.bottomBar,
    parentNavigatorKey: navigationKey,
    builder: AppBottomBarPage.builder,
  ),
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: navigationKey,
    builder: CreateTaskScreen.builder,
  ),
];
