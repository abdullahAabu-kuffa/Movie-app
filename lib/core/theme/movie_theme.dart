import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/movie_colors.dart';

class MovieTheme {
  static ThemeData get theme {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: MovieColors.primary,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: MovieColors.secondary,
      ),
    );
  }
}
