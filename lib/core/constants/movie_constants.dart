import 'package:flutter/material.dart';

// Movie Icons Constants
class MovieIcons {
  MovieIcons._();

  static const path = 'assets/icons/';
  static const String google = "${path}google.png";
}

// Movie Images Constants
class MovieImages {
  MovieImages._();

  static const path = 'assets/images/';

  static const String onboarding = '${path}onboarding.png';
}

// Movie Colors Constants
class MovieColors {
  MovieColors._();

  static const Color primbary = Color(0xFF000000);
  static const Color secondary = Color(0xFFCD3E10);
  static const Color white = Color(0xFFFFFFFF);
  static const Color white70 = Color(0xB3FFFFFF);
  static const Color gray = Color(0xFF4D4C4C);
  static const Color gray70 = Color(0xFF7C7C7C);
  static const Color grayDark = Color(0xFF1F1F1F);
  static const Color transparent = Colors.transparent;
}

// Movie Strings Constants
class MovieStrings {
  MovieStrings._();

  static const String movieLift = 'Movi';
  static const String movieRight = 'e+';
  static const String welcomeString =
      "Watch your favourite movie or series on only one platform.You cat watch it anytime and anywhere";
  static const String signinString = "Sign in";
  static const String signinByGoogleString = "Continue with Google";
  static const String hintSearchString = "Search movies...";
  static const String titleSectionPopular = "Popular Movies";
}
