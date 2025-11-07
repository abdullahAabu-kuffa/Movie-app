import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/movie_colors.dart';
import 'package:movie_app/logic/cubit/video_cubit/Video_state.dart';
import 'package:movie_app/logic/cubit/video_cubit/video_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailerScreen extends StatefulWidget {
  final int movieId;
  const MovieTrailerScreen({super.key, required this.movieId});
  @override
  State<MovieTrailerScreen> createState() => _MovieTrailerScreenState();
}

class _MovieTrailerScreenState extends State<MovieTrailerScreen> {
  late YoutubePlayerController _youtubeController;
  bool _hidePlayer = false;

  @override
  void initState() {
    super.initState();
    context.read<VideoCubit>().getVideo(widget.movieId);
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (!didPop) {
          setState(() {
            _hidePlayer = true; // Hide player before popping
          });
        }
      },

      child: SizedBox.expand(
        child: BlocBuilder<VideoCubit, VideoState>(
          builder: (context, state) {
            if (_hidePlayer) return const SizedBox.shrink();
            if (state is VideoLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VideoFailureState) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: TextStyle(color: MovieColors.white),
                ),
              );
            } else if (state is VideoSuccessState) {
              final trailers = state.video;

              if (trailers.isEmpty) {
                return const Center(
                  child: Text(
                    'No Trailers found',
                    style: TextStyle(color: MovieColors.white),
                  ),
                );
              }

              final firstTrailer = trailers.firstWhere(
                (t) => t.site == "YouTube",
                orElse: () => trailers.first,
              );

              _youtubeController = YoutubePlayerController(
                initialVideoId: firstTrailer.key,
                flags: const YoutubePlayerFlags(
                  showLiveFullscreenButton: true,
                  autoPlay: true,
                ),
              );
              if (_hidePlayer) return const SizedBox.shrink();
              return Flexible(
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: _youtubeController,
                    width: MediaQuery.of(context).size.width,
                  ),

                  builder: (context, player) {
                    return player;
                  },
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
