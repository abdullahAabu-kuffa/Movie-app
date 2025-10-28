// Movie Icons Constants
import 'package:flutter/material.dart';

class MovieIcons {
  MovieIcons._();

  static const path = 'assets/icons/';
  static const Icon homeIcon = Icon(Icons.home_outlined);
  static const Icon videoIcon = Icon(Icons.video_library);
  static const Icon favoriteIcon = Icon(Icons.favorite_border);
  static const Icon personIcon = Icon(Icons.person_outline_sharp);
}

// Movie Images Constants
class MovieImages {
  MovieImages._();

  static const path = 'assets/images/';

  static const String onboarding = '${path}onboarding.png';
  static const String profileImage = '${path}me.jpg';
}

// Movie Strings Constants
class MovieStrings {
  MovieStrings._();

  static const String movieTitle = 'Movie App';
  static const String movieLift = 'Movi';
  static const String movieRight = 'e+';
  static const String welcomeString =
      "Watch your favourite movie or series on only one platform.You cat watch it anytime and anywhere";
  static const String signinString = "Sign in";
  static const String signinByGoogleString = "Continue with Google";
  static const String hintSearchString = "Search movies...";
  static const String titleSectionPopular = "Popular Movies";
  static const String titleSectionTVseries = 'TV Series';
  static const String titleSectionFavorites = "Favorites Movies";
  static const String titleSectionSearch = "Search Movies";
  static const String titleSectionAllMovies = "All Movies";
}

class MoviePopular {
  final String name;
  final String description;
  final String image;

  MoviePopular({
    required this.name,
    required this.description,
    required this.image,
  });
}
