import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/extensions/center.dart';
import 'package:movies_app/core/extensions/padding.dart';
import 'package:movies_app/core/extensions/size.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/custom_text_feild.dart';
import '../../wdgets/custom_film_card.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                prefixIcon: SvgPicture.asset("assets/icons/search.svg.svg"),
                hint: "Marvel",
              )
                  .setVerticalPadding(context, 0.01)
                  .setHorizontalPadding(context, 0.03),
              Wrap(
                direction: Axis.horizontal,
                spacing: 2,
                children: [
                  CustomFilmCard(
                    filmImage: AppAssets.onboardTwo,
                    filmRate: "7.7",
                    imageWidth: 0.45.width,
                    imageHeight: 0.35.height,
                  ),
                  CustomFilmCard(
                    filmImage: AppAssets.onboardTwo,
                    filmRate: "7.7",
                    imageWidth: 0.45.width,
                    imageHeight: 0.35.height,
                  ),
                  CustomFilmCard(
                    filmImage: AppAssets.onboardTwo,
                    filmRate: "7.7",
                    imageWidth: 0.45.width,
                    imageHeight: 0.35.height,
                  ),
                  CustomFilmCard(
                    filmImage: AppAssets.onboardTwo,
                    filmRate: "7.7",
                    imageWidth: 0.45.width,
                    imageHeight: 0.35.height,
                  ),
                  CustomFilmCard(
                    filmImage: AppAssets.onboardTwo,
                    filmRate: "7.7",
                    imageWidth: 0.45.width,
                    imageHeight: 0.35.height,
                  ),
                  CustomFilmCard(
                    filmImage: AppAssets.onboardTwo,
                    filmRate: "7.7",
                    imageWidth: 0.45.width,
                    imageHeight: 0.35.height,
                  ),
                  CustomFilmCard(
                    filmImage: AppAssets.onboardTwo,
                    filmRate: "7.7",
                    imageWidth: 0.45.width,
                    imageHeight: 0.35.height,
                  ),
                ],
              )
            ],
          ),
        ),
      ).setCenter(),
    );
  }
}
