import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/services/api_services.dart';
import 'package:movie_app/logic/cubit/movies_cubit/movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());

  Future<void> getMovies() async {
    emit(MoviesLoadingState());
    try {
      final movies = await ApiService().getPopularMovies();
      emit(MoviesSuccessState(movies: movies));
    } catch (error) {
      emit(MoviesFailureState(errorMessage: error.toString()));
    }
  }
}
