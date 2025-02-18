import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/padding.dart';
import 'package:movies_app/modules/onboarding/models/onboarding_model.dart';

import '../../../core/theme/color_palette.dart';
import '../../../core/widgets/custom_elevated_button.dart';

class OnboardingBody extends StatefulWidget {
  final OnboardingModel onboardingModel;

  const OnboardingBody({
    super.key,
    required this.onboardingModel,
  });

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          widget.onboardingModel.imagePath,
          fit: BoxFit.fill,
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: IntrinsicHeight(
            child: Container(
                decoration: BoxDecoration(
                    color: ColorPalette.scaffoldBackground,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.onboardingModel.title,
                      style: TextStyle(
                          color: ColorPalette.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ).setVerticalPadding(context, 0.02),
                    Text(
                      widget.onboardingModel.description,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ).setVerticalPadding(context, 0.02),
                    CustomElevatedButton(
                            onTap: () {
                              // _controler.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                            },
                            isNext: true,
                            text: widget.onboardingModel.btnTitle)
                        .setVerticalPadding(context, 0.02)
                        .setHorizontalPadding(context, 0.03),
                    CustomElevatedButton(
                            onTap: () {}, isNext: false, text: "Back")
                        .setVerticalPadding(context, 0.02)
                        .setHorizontalPadding(context, 0.03)
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
