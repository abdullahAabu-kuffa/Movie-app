import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/services/api_services.dart';
import 'package:movie_app/logic/cubit/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  Future<void> getSearch(String query) async {
    if (query.isEmpty) {
      emit(SearchInitialState());
      return;
    }
    emit(SearchLoadingState());
    try {
      final searchMovies = await ApiService().searchMovies(query);
      emit(SearchSuccessState(searchMovies: searchMovies));
    } catch (error) {
      emit(SearchFailureState(errorMessage: error.toString()));
    }
  }
}
