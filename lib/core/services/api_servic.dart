import 'package:dio/dio.dart';
import '../../models/movie_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://yts.mx/api/v2';

  Future<List<Movie>> fetchMovies(
      {String genre = '', String query = ''}) async {
    try {
      final response =
          await _dio.get('$baseUrl/list_movies.json', queryParameters: {
        if (genre.isNotEmpty) 'genre': genre,
        if (query.isNotEmpty) 'query_term': query,
      });

      if (response.statusCode == 200) {
        List results = response.data['data']['movies'] ?? [];
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
