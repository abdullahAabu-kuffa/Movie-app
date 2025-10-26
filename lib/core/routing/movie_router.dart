import 'package:flutter/material.dart';
import 'package:movie_app/ui/screens/home_screen.dart';
import 'package:movie_app/ui/screens/onboarding_screen.dart';

//app router 
class MovieRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
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