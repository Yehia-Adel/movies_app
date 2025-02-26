import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/padding.dart';
import 'package:movies_app/core/extensions/size.dart';
import 'package:movies_app/modules/layout/pages/browse/widgets/custom_tab_Bar.dart';
import 'package:movies_app/modules/layout/wdgets/custom_film_card.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/movie_provider.dart';

class BrowseScreen extends StatefulWidget {
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  final List<String> genres = [
    'Action',
    'Adventure',
    'Animation',
    'Comedy',
    'Drama',
    'Horror',
    'Sci-Fi'
  ];

  int selectedTap = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieProvider>(context, listen: false)
          .loadMovies(genre: genres[selectedTap]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.all(8),
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return CustomTabBar(
                  ontap: () {
                    if (selectedTap != index) {
                      setState(() {
                        selectedTap = index;
                      });
                      provider.loadMovies(genre: genres[index]);
                    }
                  },
                  tabTitle: genres[index],
                  isSelected: selectedTap == index,
                ).setHorizontalPadding(context, 0.015);
              },
            ),
          ),
          Expanded(
            child: provider.isLoading
                ? Center(child: CircularProgressIndicator())
                : provider.movies.isEmpty
                    ? Center(
                        child: Text("no movies available",
                            style: TextStyle(fontSize: 16)))
                    : GridView.builder(
                        padding: EdgeInsets.all(8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: provider.movies.length,
                        itemBuilder: (context, index) {
                          final movie = provider.movies[index];
                          return CustomFilmCard(
                            filmImage: movie.imageUrl,
                            filmRate: "${movie.rating}",
                            imageWidth: 0.45.width,
                            imageHeight: 0.35.height,
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 4),
// child: Chip(genres[index]
// label: Text(),
// backgroundColor: Colors.yellow,
// ),
// )