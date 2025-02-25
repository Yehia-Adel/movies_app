import 'package:flutter/cupertino.dart';

import '../../models/movie_model.dart';
import 'api_servic.dart';

class MovieProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Movie> _movies = [];
  bool _isLoading = false;

  List<Movie> get movies => _movies;

  bool get isLoading => _isLoading;

  Future<void> loadMovies({String genre = '', String query = ''}) async {
    _isLoading = true;
    notifyListeners();
    _movies = await _apiService.fetchMovies(genre: genre, query: query);
    _isLoading = false;
    notifyListeners();
  }
}
