import 'package:dio/dio.dart';
import 'package:movie_app/core/networking/api_constants.dart';
import 'package:movie_app/data/models/movie_video_model.dart';
import 'package:movie_app/data/models/movie_video_response.dart';
import '../models/movie_response.dart';

class ApiService {
  final Dio _dio = Dio();

  //  fetch popular movies
  Future<List<MovieResponse>> getPopularMovies({int page = 1}) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}/movie/popular',
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'language': 'en-US',
          'page': page,
        },
      );
      // Check response
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        final movieResponse = MovieResponse.fromJson(data);
        return [movieResponse];
      } else {
        throw Exception('Failed to load movies: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      // Handle Dio errors
      if (e.response != null) {
        throw Exception(
          'Dio error: ${e.response?.statusCode} - ${e.response?.data}',
        );
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  //fetch TV Series
  Future<List<MovieResponse>> getTvSeries({int page = 1}) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}/tv/popular',
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'language': 'en-US',
          'page': page,
        },
      );
      // Check response
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        final movieResponse = MovieResponse.fromJson(data);
        return [movieResponse];
      } else {
        throw Exception('Failed to load TV Series: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      // Handle Dio errors
      if (e.response != null) {
        throw Exception(
          'Dio error: ${e.response?.statusCode} - ${e.response?.data}',
        );
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  // search movies by query
  Future<List<MovieResponse>> searchMovies(String query) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}/search/movie',
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'language': 'en-US',
          'query': query,
          'include_adult': false,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        final movieResponse = MovieResponse.fromJson(data);
        return [movieResponse];
      } else {
        throw Exception('Failed to search movies');
      }
    } catch (e) {
      throw Exception('Error searching movies: $e');
    }
  }

  //fetch trailer of movie
  Future<List<MovieVideoModel>> fetchTrailer(int movieId) async {
    try {
      String id = movieId.toString();
      final response = await _dio.get(
        '${ApiConstants.baseUrl}/movie/$id/videos',
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'language': 'en-US',
          'include_adult': false,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        final videoResponse = MovieVideoResponse.fromJson(data);

        // Filter only YouTube trailers (optional)
        final trailers = videoResponse.results
            .where((v) => v.site == 'YouTube' && v.type == 'Trailer')
            .toList();

        return trailers;
      } else {
        throw Exception('Failed to display trailer');
      }
    } catch (e) {
      throw Exception('Error fetch trailer: $e');
    }
  }
}
