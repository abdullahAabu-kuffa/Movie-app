import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/movie_constants.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        MovieStrings.titleSectionPopular,
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
