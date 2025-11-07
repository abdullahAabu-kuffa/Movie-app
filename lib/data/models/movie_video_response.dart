import 'package:movie_app/data/models/movie_video_model.dart';

class MovieVideoResponse {
  final int id;
  final List<MovieVideoModel> results;

  MovieVideoResponse({required this.id, required this.results});

  factory MovieVideoResponse.fromJson(Map<String, dynamic> json) {
    return MovieVideoResponse(
      id: json['id'],
      results: (json['results'] as List)
          .map((v) => MovieVideoModel.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'results': results.map((v) => v.toJson()).toList(),
  };
}
