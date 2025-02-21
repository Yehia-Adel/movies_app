import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/extensions/center.dart';
import 'package:movies_app/core/extensions/padding.dart';
import 'package:movies_app/core/extensions/size.dart';
import 'package:movies_app/core/extensions/validations.dart';
import 'package:movies_app/core/routes/pages_route_name.dart';
import 'package:movies_app/core/services/snack_bar_services.dart';
import 'package:movies_app/core/theme/color_palette.dart';
import 'package:movies_app/core/utils/firebase_services.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_feild.dart';
import 'package:movies_app/main.dart';


class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.logo,
              height: 0.14.height,
            ).setVerticalPadding(context, 0.03),
            CustomTextField(
              controller: _emailController,
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please Enter Your Email";
                }
                if (!Validations.validateEmail(value)) {
                  return "Please enter a valid email address";
                }
                return null;
              },
              hint: "Email",
              hintColor: ColorPalette.white,
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.gmailIcon),
                color: ColorPalette.white,
              ),
            )
                .setHorizontalPadding(context, 0.01)
                .setVerticalPadding(context, 0.03)
                .setHorizontalPadding(context, 0.03),
            CustomTextField(
              controller: _passwordController,
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please Enter Password";
                }
                if (!Validations.validatePassword(value)) {
                  return "Please enter a valid Password";
                }
                return null;
              },
              isPassword: true,
              hint: "Password",
              maxLines: 1,
              hintColor: ColorPalette.white,
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.passwordIcon),
                color: ColorPalette.white,
              ),
            )
                .setHorizontalPadding(context, 0.01)
                .setHorizontalPadding(context, 0.03),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  navigatorKey.currentState!
                      .pushNamed(PagesRouteName.forgetPassword);
                },
                child: Text(
                  "Forget Password ?",
                  style: theme.textTheme.titleSmall!.copyWith(
                      color: ColorPalette.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            CustomElevatedButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  FirebaseServices.login(
                          emailAddress: _emailController.text,
                          password: _passwordController.text)
                      .then((value) {
                    EasyLoading.dismiss();
                    if (value) {
                      navigatorKey.currentState!.pushNamedAndRemoveUntil(
                          PagesRouteName.layout, (route) => false);
                    } else {
                      SnackBarService.showErrorMessage(
                          " Your password is incorrect or this account doesn’t exist");
                    }
                  });
                }
              },
              text: "Login",
            )
                .setVerticalPadding(context, 0.02)
                .setHorizontalPadding(context, 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have Account ?",
                    style: theme.textTheme.titleSmall!
                        .copyWith(color: ColorPalette.white)),
                TextButton(
                  onPressed: () {
                    navigatorKey.currentState!.pushNamed(PagesRouteName.signUp);
                  },
                  child: Text(
                    "Create One",
                    style: theme.textTheme.titleSmall!.copyWith(
                        color: ColorPalette.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    indent: 20,
                    endIndent: 30,
                    color: ColorPalette.primaryColor,
                  ),
                ),
                Text("OR",
                    style: theme.textTheme.titleSmall!
                        .copyWith(color: ColorPalette.primaryColor)),
                Expanded(
                  child: Divider(
                    indent: 20,
                    endIndent: 30,
                    color: ColorPalette.primaryColor,
                  ),
                ),
              ],
            ),
            CustomElevatedButton(
              onTap: () {},
              text: " Login With Google",
              iconImage: AssetImage(
                "assets/icons/movie_icon _google.png",
              ),
            )
                .setVerticalPadding(context, 0.02)
                .setHorizontalPadding(context, 0.03)
          ],
        ),
      ),
    ).setCenter();
  }
}
