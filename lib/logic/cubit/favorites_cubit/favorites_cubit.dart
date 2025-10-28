import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/models/movie_model.dart';

class FavoritesCubit extends Cubit<List<MovieModel>> {
  FavoritesCubit() : super([]);

  void addMovieToFavorites(MovieModel movie) {
    final updatedFavorites = List<MovieModel>.from(state);
    updatedFavorites.add(movie);
    emit(updatedFavorites);
  }

  void removeMovieFromFavorites(MovieModel movie) {
    final updatedFavorites = List<MovieModel>.from(state);
    updatedFavorites.remove(movie);
    emit(updatedFavorites);
  }
}
