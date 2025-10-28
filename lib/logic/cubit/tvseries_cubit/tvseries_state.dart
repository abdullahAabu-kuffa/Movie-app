import 'package:movie_app/data/models/movie_response.dart';

abstract class TvSeriesState {}

class TvSeriesInitial extends TvSeriesState {}

class TvSeriesSuccessState extends TvSeriesState {
  final List<MovieResponse> tvSeries;

  TvSeriesSuccessState({required this.tvSeries});
}

class TvSeriesFailureState extends TvSeriesState {
  final String errorMessage;

  TvSeriesFailureState({required this.errorMessage});
}

class TvSeriesLoadingState extends TvSeriesState {}
