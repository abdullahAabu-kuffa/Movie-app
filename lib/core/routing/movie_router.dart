import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/ui/screens/home_screen.dart';
import 'package:movie_app/ui/screens/movie_details.dart';
import 'package:movie_app/ui/screens/movie_trailer_screen.dart';
import 'package:movie_app/ui/screens/onboarding_screen.dart';

//app router
class MovieRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.movieDetails:
        final movie = settings.arguments as MovieModel;
        return MaterialPageRoute(builder: (_) => MovieDetails(movie: movie)); 
      case Routes.movieVideo:
        final movieId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => MovieTrailerScreen(movieId: movieId),
        );
      default:
        return null;
    }
  }
}

//the routes of screens
class Routes {
  Routes._();

  static const String initialRoute = '/';
  static const String homeRoute = '/home';
  static const String movieDetails = '/movieDetails';
  static const String movieVideo = "/movieVideo";
}
