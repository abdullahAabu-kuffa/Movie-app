import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/services/api_services.dart';
import 'package:movie_app/logic/cubit/TvSeries_cubit/TvSeries_state.dart';

class TvSeriesCubit extends Cubit<TvSeriesState> {
  TvSeriesCubit() : super(TvSeriesInitial());

  Future<void> getTvSeries() async {
    emit(TvSeriesLoadingState());
    try {
      final tvSeries = await ApiService().getTvSeries();
      emit(TvSeriesSuccessState(tvSeries: tvSeries));
    } catch (error) {
      emit(TvSeriesFailureState(errorMessage: error.toString()));
    }
  }
}
