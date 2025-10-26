import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/movie_constants.dart';
import 'package:movie_app/core/theme/movie_colors.dart';

class MovieWelText extends StatelessWidget {
  const MovieWelText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      MovieStrings.welcomeString,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
        fontFamily: "Inter",
        fontWeight: FontWeight.bold,
        color: MovieColors.white70,
      ),
    );
  }
}
