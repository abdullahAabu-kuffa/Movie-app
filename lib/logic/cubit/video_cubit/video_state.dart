
import '../../../data/models/movie_video_model.dart';

abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoSuccessState extends VideoState {
  final List<MovieVideoModel> video;
  
  VideoSuccessState({required this.video});
}

class VideoFailureState extends VideoState {
  final String errorMessage;

  VideoFailureState({required this.errorMessage});
}

class VideoLoadingState extends VideoState {}
