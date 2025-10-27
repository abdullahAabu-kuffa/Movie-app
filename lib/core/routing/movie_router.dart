import 'package:flutter/material.dart';
import 'package:movie_app/ui/screens/home_screen.dart';
import 'package:movie_app/ui/screens/movie_details.dart';
import 'package:movie_app/ui/screens/onboarding_screen.dart';

//app router 
class MovieRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    
    // final MoviePopular mockMovie = MoviePopular(
    //   name: "Test Movie Title",
    //   description: "This is a temporary description for debugging the Details Screen.",
    //   image: "assets/images/onboarding.png", 
    // );

    
    switch (settings.name) {

      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      // case Routes.initialRoute:
        // return MaterialPageRoute(builder: (_) => MovieDetails(movie:   mockMovie));
      default:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
    }
  }
}

//the routes of screens
class Routes{
  Routes._();

  static const String initialRoute = '/';
  static const String homeRoute = '/home';
}