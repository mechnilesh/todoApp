import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/config/routes/routes.dart';
import 'package:todoapp/config/theme/theme.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig = ref.watch(routesProviders);

    return MaterialApp.router(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
    
      routerConfig: routeConfig,
      
    );
  }
}
