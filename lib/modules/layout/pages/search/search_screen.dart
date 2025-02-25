import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/padding.dart';
import 'package:movies_app/core/extensions/size.dart';
import 'package:movies_app/core/widgets/custom_text_feild.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/movie_provider.dart';
import '../../wdgets/custom_film_card.dart';


class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          CustomTextField(
            // decoration: InputDecoration(
            hint: 'Search for a movie...',
            prefixIcon: Icon(Icons.search),
            //   border: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(16)
            //   ),
            // ),
            onChanged: (query) {
              provider.loadMovies(query: "$query");
            },
          ).setHorizontalPadding(context, 0.03),
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
