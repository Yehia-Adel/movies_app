import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/center.dart';
import 'package:movies_app/core/extensions/size.dart';
import 'package:movies_app/modules/layout/pages/browse/widgets/custom_tab_Bar.dart';

import '../../../../core/constants/app_assets.dart';
import '../../wdgets/custom_film_card.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: TabBar(
          labelPadding: EdgeInsets.only(left: 5, right: 5, top: 25),
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          tabAlignment: TabAlignment.start,
          padding: EdgeInsets.symmetric(vertical: 5),
          isScrollable: true,
          tabs: [
            CustomTabBar(
              tabTitle: "Action",
              ontap: () {},
              isSelected: true,
            ),
            CustomTabBar(
              tabTitle: "Adventure",
              ontap: () {},
              isSelected: false,
            ),
            CustomTabBar(
              tabTitle: "Animation",
              ontap: () {},
              isSelected: false,
            ),
            CustomTabBar(
              tabTitle: "Biography",
              ontap: () {},
              isSelected: false,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
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
