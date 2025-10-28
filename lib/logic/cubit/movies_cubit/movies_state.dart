import 'package:movie_app/data/models/movie_response.dart';

abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesSuccessState extends MoviesState {
  final List<MovieResponse> movies;
  
  MoviesSuccessState({required this.movies});
}

class MoviesFailureState extends MoviesState {
  final String errorMessage;

  MoviesFailureState({required this.errorMessage});
}

class MoviesLoadingState extends MoviesState {}
