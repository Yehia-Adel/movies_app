import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/padding.dart';
import 'package:movies_app/modules/onboarding/models/onboarding_model.dart';

import '../../../core/theme/color_palette.dart';
import '../../../core/widgets/custom_elevated_button.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var _controler = PageController();

  int selctedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: _controler,
          onPageChanged: (index) {
            selctedIndex = index;
          },
          itemCount: OnboardingModel.onboardingList.length,
          itemBuilder: (context, index) {
            var onboardingModel = OnboardingModel.onboardingList[index];
            return Stack(
              children: [
                Image.asset(
                  onboardingModel.imagePath,
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
                              onboardingModel.title,
                              style: TextStyle(
                                  color: ColorPalette.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ).setVerticalPadding(context, 0.02),
                            Text(
                              onboardingModel.description,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ).setVerticalPadding(context, 0.02),
                            CustomElevatedButton(
                                    onTap: () {
                                      _controler.nextPage(
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeInOut);
                                    },
                                    isNext: true,
                                    text: onboardingModel.btnTitle)
                                .setVerticalPadding(context, 0.02)
                                .setHorizontalPadding(context, 0.03),
                            selctedIndex > 0 && selctedIndex < 4
                                ? CustomElevatedButton(
                                        onTap: () {
                                          _controler.previousPage(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.easeInOut);
                                        },
                                        isNext: false,
                                        text: "Back")
                                    .setVerticalPadding(context, 0.02)
                                    .setHorizontalPadding(context, 0.03)
                                : SizedBox()
                          ],
                        )),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
