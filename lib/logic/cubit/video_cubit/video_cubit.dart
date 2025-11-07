import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/services/api_services.dart';
import 'package:movie_app/logic/cubit/video_cubit/Video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  Future<void> getVideo(int movieId) async {
    emit(VideoLoadingState());
    try {
      final video = await ApiService().fetchTrailer(movieId);
      emit(VideoSuccessState(video: video));
    } catch (error) {
      emit(VideoFailureState(errorMessage: error.toString()));
    }
  }
}
