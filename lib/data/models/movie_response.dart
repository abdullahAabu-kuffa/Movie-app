
import 'movie_model.dart';

class MovieResponse {
  final int page;
  final List<MovieModel> results;
  final int? totalPages;
  final int? totalResults;

  MovieResponse({
    required this.page,
    required this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      page: json['page'] ?? 1,
      results:
          (json['results'] as List<dynamic>?)
              ?.map((item) => MovieModel.fromJson(item))
              .toList() ??
          [],
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((movie) => movie.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
