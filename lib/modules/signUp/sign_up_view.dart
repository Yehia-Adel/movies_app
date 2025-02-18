import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/extensions/padding.dart';
import 'package:movies_app/core/extensions/size.dart';
import 'package:movies_app/core/theme/color_palette.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_feild.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          CarouselSlider(
            items: charactersList.map((item) =>
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                  ),
                )).toList(),
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
          Text("Avatar", style: theme.textTheme.titleSmall!
              .copyWith(color: ColorPalette.white),),

          CustomTextField(
            hint: "Name",
            prefixIcon: ImageIcon(AssetImage(AppAssets.nameIcon,),
              color: ColorPalette.white,),
          ).setHorizontalPadding(context, 0.03).setVerticalPadding(
              context, 0.01),
          CustomTextField(
            hint: "Email",
            prefixIcon: ImageIcon(AssetImage(AppAssets.gmailIcon,),
              color: ColorPalette.white,),)
              .setHorizontalPadding(context, 0.03)
              .setVerticalPadding(context, 0.01),
          CustomTextField(
            // isPassword: true,
            hint: "Password",
            prefixIcon: ImageIcon(AssetImage(AppAssets.passwordIcon,),
              color: ColorPalette.white,),)
              .setHorizontalPadding(context, 0.03)
              .setVerticalPadding(context, 0.01),
          CustomTextField(
            hint: "Confirm Password",
            prefixIcon: ImageIcon(AssetImage(AppAssets.passwordIcon,),
              color: ColorPalette.white,),)
              .setHorizontalPadding(context, 0.03)
              .setVerticalPadding(context, 0.01),
          CustomTextField(
            hint: "Phone Number",
            prefixIcon: ImageIcon(AssetImage(AppAssets.phoneIcon,),
              color: ColorPalette.white,),)
              .setHorizontalPadding(context, 0.03)
              .setVerticalPadding(context, 0.01),
          CustomElevatedButton(text: "Create Account", onTap: () {})
              .setHorizontalPadding(context, 0.03).setVerticalPadding(
              context, 0.02),


        ],
      ),

    );
  }
}
