import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/movie_constants.dart';

class MovieWelIcon extends StatelessWidget {
  const MovieWelIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          MovieStrings.movieLift,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: MovieColors.white,
          ),
        ),
        Text(
          MovieStrings.movieRight,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: MovieColors.secondary,
          ),
        ),
      ],
    );
  }
}
