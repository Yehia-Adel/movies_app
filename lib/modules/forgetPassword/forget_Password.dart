import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/extensions/padding.dart';
import 'package:movies_app/core/extensions/size.dart';
import 'package:movies_app/core/extensions/validations.dart';
import 'package:movies_app/core/theme/color_palette.dart';

import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_text_feild.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("ForgetPassword", style:
        theme.textTheme.titleSmall!
            .copyWith(color: ColorPalette.primaryColor,
        ),),
        iconTheme: IconThemeData(
            color: ColorPalette.primaryColor
        ),
      ),
      body: Column(
        children: [
          Image.asset(AppAssets.forgetPassword, height: 0.4.height,),
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
            hint: "Email",
            prefixIcon: ImageIcon(AssetImage(AppAssets.gmailIcon,),
              color: ColorPalette.white,),)
              .setHorizontalPadding(context, 0.03)
              .setVerticalPadding(context, 0.01),
          CustomElevatedButton(text: "Verify Email", onTap: () {})
              .setHorizontalPadding(context, 0.03).setVerticalPadding(
              context, 0.02),

        ],
      ),
    );
  }
}
