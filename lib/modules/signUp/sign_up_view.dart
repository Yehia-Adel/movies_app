import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/extensions/padding.dart';
import 'package:movies_app/core/extensions/size.dart';
import 'package:movies_app/core/extensions/validations.dart';
import 'package:movies_app/core/routes/pages_route_name.dart';
import 'package:movies_app/core/theme/color_palette.dart';
import 'package:movies_app/core/utils/firebase_services.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_feild.dart';
import 'package:movies_app/main.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  List<String> charactersList = [
    "assets/images/character/gamer (1).png",
    "assets/images/character/gamer (1) (1).png",
    "assets/images/character/gamer (1) (2).png",
    "assets/images/character/gamer (1) (3).png",
    "assets/images/character/gamer (1) (4).png",
    "assets/images/character/gamer (1) (5).png",
    "assets/images/character/gamer (1) (6).png",
    "assets/images/character/gamer (1) (7).png",
    "assets/images/character/gamer (1) (8).png"
  ];

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: ColorPalette.primaryColor
        ),
        title: Text("Register", style: theme.textTheme.titleSmall!
            .copyWith(color: ColorPalette.primaryColor,
        ),),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CarouselSlider(
              items: charactersList
                  .map((item) => Container(
                        margin: EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child:
                              Image.asset(item, fit: BoxFit.cover, width: 1000),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 0.4,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                height: 0.18.height,
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                initialPage: 0,
              ),
            ),
            Text(
              "Avatar",
              style: theme.textTheme.titleSmall!
                  .copyWith(color: ColorPalette.white),
            ),
            CustomTextField(
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
              controller: _nameController,
              hint: "Name",
              prefixIcon: ImageIcon(
                AssetImage(
                  AppAssets.nameIcon,
                ),
                color: ColorPalette.white,
              ),
            )
                .setHorizontalPadding(context, 0.03)
                .setVerticalPadding(context, 0.01),
            CustomTextField(
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter your Email";
                }
                if (!Validations.validateEmail(value)) {
                  return "Please enter a valid Email address";
                }
                return null;
              },
              controller: _emailController,
              hint: "Email",
              prefixIcon: ImageIcon(
                AssetImage(
                  AppAssets.gmailIcon,
                ),
                color: ColorPalette.white,
              ),
            )
                .setHorizontalPadding(context, 0.03)
                .setVerticalPadding(context, 0.01),
            CustomTextField(
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter your Password";
                }
                if (!Validations.validatePassword(value)) {
                  return "Please enter a valid Password";
                }
                return null;
              },
              isPassword: true,
              maxLines: 1,
              hint: "Password",
              prefixIcon: ImageIcon(
                AssetImage(
                  AppAssets.passwordIcon,
                ),
                color: ColorPalette.white,
              ),
            )
                .setHorizontalPadding(context, 0.03)
                .setVerticalPadding(context, 0.01),
            CustomTextField(
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter your Password";
                }
                if (!Validations.validatePassword(value)) {
                  return "Please enter a valid Password";
                }
                if (value != _passwordController.text) {
                  return "Password not match";
                }
                return null;
              },
              isPassword: true,
              maxLines: 1,
              hint: "Confirm Password",
              prefixIcon: ImageIcon(
                AssetImage(
                  AppAssets.passwordIcon,
                ),
                color: ColorPalette.white,
              ),
            )
                .setHorizontalPadding(context, 0.03)
                .setVerticalPadding(context, 0.01),
            CustomTextField(
              controller: _phoneController,
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter your Phone Number";
                }
                return null;
              },
              hint: "Phone Number",
              prefixIcon: ImageIcon(
                AssetImage(
                  AppAssets.phoneIcon,
                ),
                color: ColorPalette.white,
              ),
            )
                .setHorizontalPadding(context, 0.03)
                .setVerticalPadding(context, 0.01),
            CustomElevatedButton(
                    text: "Create Account",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        FirebaseServices.createAccount(
                                emailAddress: _emailController.text,
                                password: _passwordController.text)
                            .then((value) {
                          EasyLoading.dismiss();
                          if (value) {
                            navigatorKey.currentState!.pushNamedAndRemoveUntil(
                                PagesRouteName.signIn, (route) => false);
                          }
                        });
                      }
                    })
                .setHorizontalPadding(context, 0.03)
                .setVerticalPadding(context, 0.02),
          ],
        ),
      ),

    );
  }
}
