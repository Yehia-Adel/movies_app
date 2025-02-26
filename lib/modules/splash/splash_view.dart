import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/localStorageKey.dart';
import 'package:movies_app/core/extensions/center.dart';
import 'package:movies_app/core/services/local_storage_service.dart';

import '../../core/routes/pages_route_name.dart';
import '../../main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      var isFirstTime =
          LocalStorageService.getBool(LocalStorageKey.isFirstRun) ?? true;

      navigatorKey.currentState!.pushNamedAndRemoveUntil(
          isFirstTime ? PagesRouteName.onboardingScreen : PagesRouteName.signIn,
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorPalette.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/movie-logo.png", height: 120,),
        ],
      ),
    ).setCenter();
  }
}
