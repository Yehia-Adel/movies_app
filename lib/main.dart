import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/app_routes.dart';
import 'package:movies_app/core/theme/app_theme_manager.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppThemeManager.lightMode,
      navigatorKey: navigatorKey,
    );
  }
}
