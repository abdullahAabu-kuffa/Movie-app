import 'package:movie_app/data/models/movie_response.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<MovieResponse> searchMovies;
  
  SearchSuccessState({required this.searchMovies});
}

class SearchFailureState extends SearchState {
  final String errorMessage;

  SearchFailureState({required this.errorMessage});
}

class SearchLoadingState extends SearchState {}
