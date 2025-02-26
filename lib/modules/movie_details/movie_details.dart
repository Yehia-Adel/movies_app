import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/size.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_assets.dart';
import '../../core/services/movie_provider.dart';
import '../../core/theme/color_palette.dart';
import '../../main.dart';
import '../layout/wdgets/custom_film_card.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    List<String> screenShots = [
      "assets/images/screenShot1.png",
      "assets/images/screenShot2.png",
      "assets/images/screenShot3.png",
    ];
    final provider = Provider.of<MovieProvider>(context);
    final movie = provider.movies;

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Stack(
              children: [
                Positioned.fill(child: Image.network("")),
                Positioned(
                  top: 40,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          navigatorKey.currentState!.pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.22,
                  left: MediaQuery.of(context).size.width * 0.5 - 35,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(Icons.play_arrow,
                        size: 50, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 45,
                  child: Column(
                    children: [
                      const Text(
                        "Doctor Strange in the Multiverse\n of Madness",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "2022",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {},
                    child: const Text("Watch",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        color: ColorPalette.generalGreyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.favorite, color: Colors.yellow, size: 20),
                          SizedBox(width: 5),
                          Text("15", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorPalette.generalGreyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 40,
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.comment, color: Colors.yellow, size: 20),
                          SizedBox(width: 5),
                          Text("90", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorPalette.generalGreyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.star, color: Colors.yellow, size: 20),
                          SizedBox(width: 5),
                          Text("7.6", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Screen Shots",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: List.generate(screenShots.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          screenShots[index],
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Similar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 2,
                  children: [
                    CustomFilmCard(
                      filmImage: AppAssets.onboardTwo,
                      filmRate: "7.7",
                      imageWidth: 0.35.width,
                      imageHeight: 0.25.height,
                    ),
                    CustomFilmCard(
                      filmImage: AppAssets.onboardTwo,
                      filmRate: "7.7",
                      imageWidth: 0.35.width,
                      imageHeight: 0.25.height,
                    ),
                    CustomFilmCard(
                      filmImage: AppAssets.onboardTwo,
                      filmRate: "7.7",
                      imageWidth: 0.35.width,
                      imageHeight: 0.25.height,
                    ),
                    CustomFilmCard(
                      filmImage: AppAssets.onboardTwo,
                      filmRate: "7.7",
                      imageWidth: 0.35.width,
                      imageHeight: 0.25.height,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Summary",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Text(
                  "Following the events of Spider-Man No Way Home, "
                  "Doctor Strange unwittingly casts a forbidden spell that"
                  " accidentally opens up the multiverse. With help from Wong"
                  " and Scarlet Witch, Strange confronts various versions of"
                  " himself as well as teaming up with the young America Chavez while"
                  " traveling through various realities and working to restore "
                  "reality as he knows it. Along the way, Strange and his allies"
                  " realize they must take on a powerful"
                  " new adversary who seeks to take over the multiverse.—Blazer346",
                  style: TextStyle(color: ColorPalette.white),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Cast",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: ColorPalette.generalGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Image.asset("assets/images/Hayley.png"),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Name : Hayley AtWell",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Character : Captain Carter",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: ColorPalette.generalGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Image.asset("assets/images/Hayley.png"),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Name : Hayley AtWell",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Character : Captain Carter",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: ColorPalette.generalGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Image.asset("assets/images/Hayley.png"),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Name : Hayley AtWell",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Character : Captain Carter",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: ColorPalette.generalGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Image.asset("assets/images/Hayley.png"),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Name : Hayley AtWell",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Character : Captain Carter",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
