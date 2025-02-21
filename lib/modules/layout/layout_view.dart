import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/center.dart';
import 'package:movies_app/core/extensions/size.dart';
import 'package:movies_app/modules/layout/wdgets/custom_film_card.dart';

import '../../core/constants/app_assets.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          // appBar: TabBar(
          //
          //   isScrollable: true,
          //     tabs: [
          //
          //     ]),
          body: SingleChildScrollView(
            child: Column(
              children: [
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
      ),
    );
  }
}
