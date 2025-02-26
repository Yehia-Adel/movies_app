import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/padding.dart';
import 'package:movies_app/core/extensions/size.dart';
import 'package:movies_app/core/theme/color_palette.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/modules/layout/wdgets/custom_film_card.dart';
import 'package:movies_app/modules/movie_details/movie_details.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/movie_provider.dart';

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
    final provider = Provider.of<MovieProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: provider.isLoading
                ? Center(child: CircularProgressIndicator())
                : provider.movies.isEmpty
                    ? Center(
                        child: Text("no movies available",
                            style: TextStyle(fontSize: 16)))
                    : Stack(
                        children: [
                          Opacity(
                            opacity: 0.2,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      provider.movies[selectedIndex].imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CarouselSlider(
                              items: provider.movies
                                  .map((movie) => GestureDetector(
                                        onTap: () {
                                          navigatorKey.currentState!.push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MovieDetails()));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            image: DecorationImage(
                                              image:
                                                  NetworkImage(movie.imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
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
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
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
                      ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Actions",
                  style: TextStyle(
                    color: ColorPalette.white,
                  )),
              TextButton(
                onPressed: () {},
                child: Text("See more",
                    style: TextStyle(
                      color: ColorPalette.primaryColor,
                    )),
              )
            ],
          ).setHorizontalPadding(context, 0.03),
          Expanded(
            flex: 3,
            child: provider.isLoading
                ? Center(child: CircularProgressIndicator())
                : provider.movies.isEmpty
                    ? Center(
                        child: Text("No movies available",
                            style: TextStyle(
                                fontSize: 20,
                                color: ColorPalette.generalGreyColor)))
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(8),
                        itemCount: provider.movies.length,
                        itemBuilder: (context, index) {
                          final movie = provider.movies[index];
                          return CustomFilmCard(
                            filmImage: movie.imageUrl,
                            filmRate: "${movie.rating}",
                            imageWidth: 0.45.width,
                            imageHeight: 0.35.height,
                          ).setHorizontalPadding(context, 0.01);
                        },
                      ),
          )
        ],
      ),
    );
  }
}
