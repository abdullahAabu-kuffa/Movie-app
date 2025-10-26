import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/movie_colors.dart';

class MovieTitleSection extends StatelessWidget {
  const MovieTitleSection({super.key, required this.titleSectionPopular});
  final String titleSectionPopular;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        titleSectionPopular,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
          color: MovieColors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
