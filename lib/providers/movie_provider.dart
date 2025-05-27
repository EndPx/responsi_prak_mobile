import 'package:flutter/foundation.dart';
import '../models/movie.dart';
import '../services/api_service.dart';

class MovieProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Movie> _movies = [];
  Movie? _selectedMovie;
  bool _isLoading = false;

  List<Movie> get movies => _movies;
  Movie? get selectedMovie => _selectedMovie;
  bool get isLoading => _isLoading;

  Future<void> fetchMovie() async {
    _isLoading = true;
    notifyListeners();
    try {
      _movies = await _apiService.getMovie();
    } catch (e) {
      print('Error fetching movies: $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchMovieById(String id) async {
    _isLoading = true;
    notifyListeners();
    try {
      _selectedMovie = await _apiService.getMovieById(id);
    } catch (e) {
      print('Error fetching movie: $e');
    }
    _isLoading = false;
    notifyListeners();
  }
}