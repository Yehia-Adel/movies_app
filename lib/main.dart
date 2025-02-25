import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movies_app/core/routes/app_routes.dart';
import 'package:movies_app/core/services/loading_service.dart';
import 'package:movies_app/core/services/local_storage_service.dart';
import 'package:movies_app/core/theme/app_theme_manager.dart';
import 'package:provider/provider.dart';

import 'core/services/movie_provider.dart';
import 'firebase_options.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MovieProvider()),
    ],
    child: MyApp(),
  ));
  configLoading();
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
      builder: EasyLoading.init(builder: BotToastInit()),
    );
  }
}
