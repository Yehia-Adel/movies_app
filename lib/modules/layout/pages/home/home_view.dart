import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/size.dart';
import 'package:movies_app/core/theme/color_palette.dart';
import 'package:movies_app/modules/layout/wdgets/custom_film_card.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> movies = [
    "assets/images/Movies-onboarding-1.png",
    "assets/images/Movies-onboarding-2.png",
    "assets/images/Movies-onboarding-3.png",
    "assets/images/Movies-onboarding-4.png",
    "assets/images/Movies-onboarding-5.png",
    "assets/images/Movies-onboarding-6.png"
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 7,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                movies[selectedIndex],
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CarouselSlider(
                        items: movies
                            .map((item) => Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  // height: .2.height,
                                  // width: .3.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      image: DecorationImage(
                                          image: AssetImage(item),
                                          fit: BoxFit.cover)),
                                ))
                            .toList(),
                        options: CarouselOptions(
                          height: .4.height,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.6,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: false,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          onPageChanged: (index, reason) {
                            selectedIndex = index;
                            setState(() {});
                          },
                          scrollDirection: Axis.horizontal,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/images/Available Now.png",
                        width: 0.5.width,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/Watch Now.png",
                      width: 0.7.width,
                    ),
                  ),
                ],
              )),
          Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Action",
                          style: theme.textTheme.titleSmall!.copyWith(
                            color: ColorPalette.white,
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  "see more",
                                  style: theme.textTheme.titleSmall!.copyWith(
                                      color: ColorPalette.primaryColor),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: ColorPalette.primaryColor,
                                )
                              ],
                            ))
                      ],
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 3,
                      children: [
                        CustomFilmCard(
                            filmImage: "assets/images/Movies-onboarding-3.png",
                            filmRate: "9.1",
                            imageWidth: 0.28.width,
                            imageHeight: 0.28.height),
                        CustomFilmCard(
                            filmImage: "assets/images/Movies-onboarding-4.png",
                            filmRate: "9.1",
                            imageWidth: 0.28.width,
                            imageHeight: 0.28.height),
                        CustomFilmCard(
                            filmImage: "assets/images/Movies-onboarding-5.png",
                            filmRate: "9.1",
                            imageWidth: 0.28.width,
                            imageHeight: 0.28.height),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
