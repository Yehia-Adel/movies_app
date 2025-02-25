import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/size.dart';
import 'package:movies_app/modules/layout/pages/browse/widgets/custom_tab_Bar.dart';
import 'package:movies_app/modules/layout/wdgets/custom_film_card.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/movie_provider.dart';

class BrowseScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);

    return Scaffold(
      // appBar: AppBar(title: Text('Browse Movies')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Chip(
                    label: Text(genres[index]),
                    backgroundColor: Colors.yellow,
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: provider.isLoading
                ? Center(child: CircularProgressIndicator())
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
                          imageHeight: 0.35.height);
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
// child: GestureDetector(
// onTap: () {
// // provider.loadMovies(genre: genres[index]);
// },
// child: Chip(
// // label: Text(genres[index]),
// backgroundColor: Colors.yellow,
// ),
// ),
// )
