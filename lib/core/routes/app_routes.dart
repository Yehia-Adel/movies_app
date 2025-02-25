import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/pages_route_name.dart';
import 'package:movies_app/modules/forgetPassword/forget_Password.dart';
import 'package:movies_app/modules/layout/layout_view.dart';
import 'package:movies_app/modules/layout/pages/account/edit_profile.dart';
import 'package:movies_app/modules/onboarding/pages/onboarding_screen.dart';
import 'package:movies_app/modules/signIn/sign_in_view.dart';
import 'package:movies_app/modules/signUp/sign_up_view.dart';
import 'package:movies_app/modules/splash/splash_view.dart';

abstract class AppRoutes {
  static Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case PagesRouteName.initial:
        return MaterialPageRoute(
            builder: (context) => SplashView(), settings: setting);

      case PagesRouteName.onboardingScreen:
        return MaterialPageRoute(
            builder: (context) => OnboardingScreen(), settings: setting);

      case PagesRouteName.signUp:
        return MaterialPageRoute(
            builder: (context) => SignUpView(), settings: setting);

      case PagesRouteName.forgetPassword:
        return MaterialPageRoute(
            builder: (context) => ForgetPassword(), settings: setting);

      case PagesRouteName.signIn:
        return MaterialPageRoute(
            builder: (context) => SignInView(), settings: setting);

      case PagesRouteName.layout:
        return MaterialPageRoute(
            builder: (context) => LayoutView(), settings: setting);

      case PagesRouteName.editProfile:
        return MaterialPageRoute(
            builder: (context) => EditProfile(), settings: setting);

      default:
        return MaterialPageRoute(
            builder: (context) => SplashView(), settings: setting);
    }
  }
}
