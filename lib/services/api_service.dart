import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  static const String baseUrl = 'https://681388b3129f6313e2119693.mockapi.io/api/v1';

  Future<List<Movie>> getMovie() async {
    final response = await http.get(Uri.parse('$baseUrl/movie'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<Movie> getMovieById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/movie/$id'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Movie.fromJson(data);
    } else {
      throw Exception('Failed to load movie');
    }
  }
}