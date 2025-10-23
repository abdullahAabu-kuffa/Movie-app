import 'package:flutter/material.dart';
import 'package:movie_app/ui/screens/home_screen.dart';
import 'package:movie_app/ui/screens/onboarding_screen.dart';
import 'package:movie_app/core/constants/movie_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',

      //movie theme
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: MovieColors.primbary,
      ),

      //all routes of movie
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/home': (context) => HomeScreen(),
      },
      // home: const OnboardingScreen(),
    );
  }
}
