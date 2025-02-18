import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/extensions/center.dart';
import 'package:movies_app/core/extensions/padding.dart';
import 'package:movies_app/core/extensions/size.dart';
import 'package:movies_app/core/routes/pages_route_name.dart';
import 'package:movies_app/core/theme/color_palette.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_feild.dart';
import 'package:movies_app/main.dart';


class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.logo, height: 0.14.height,).setVerticalPadding(
              context, 0.03),
          CustomTextField(
            hint: "Email",
            hintColor: ColorPalette.white,
            prefixIcon: ImageIcon(
              AssetImage(AppAssets.gmailIcon), color: ColorPalette.white,
            ),
          ).setHorizontalPadding(context, 0.01).setVerticalPadding(
              context, 0.03).setHorizontalPadding(context, 0.03),
          CustomTextField(
            // isPassword: true,
            hint: "Password",
            hintColor: ColorPalette.white,
            prefixIcon: ImageIcon(
              AssetImage(AppAssets.passwordIcon), color: ColorPalette.white,
            ),
          ).setHorizontalPadding(context, 0.01).setHorizontalPadding(
              context, 0.03),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                navigatorKey.currentState!.pushNamed(
                    PagesRouteName.forgetPassword);
              },
              child: Text("Forget Password ?", style:
              theme.textTheme.titleSmall!.copyWith(
                  color: ColorPalette.primaryColor,
                  fontWeight: FontWeight.bold
              ),)
              ,),
          ),
          CustomElevatedButton(
            onTap: () {},
            text: "Login",
          ).setVerticalPadding(context, 0.02).setHorizontalPadding(
              context, 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't Have Account ?", style:
              theme.textTheme.titleSmall!.copyWith(
                  color: ColorPalette.white
              )),
              TextButton(
                onPressed: () {
                  navigatorKey.currentState!.pushNamed(PagesRouteName.signUp);
                },
                child: Text("Create One", style:
                theme.textTheme.titleSmall!.copyWith(
                    color: ColorPalette.primaryColor,
                    fontWeight: FontWeight.bold
                ),)
                ,)
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
              Text("OR", style:
              theme.textTheme.titleSmall!.copyWith(
                  color: ColorPalette.primaryColor)
              ),
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
            iconImage: AssetImage("assets/icons/movie_icon _google.png",),)
              .setVerticalPadding(context, 0.02)
              .setHorizontalPadding(context, 0.03)


        ],
      ),
    ).setCenter();
  }
}
