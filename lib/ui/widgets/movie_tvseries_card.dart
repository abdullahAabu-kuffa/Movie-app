import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/movie_colors.dart';

class MovieTVSeriesCard extends StatelessWidget {
  const MovieTVSeriesCard({
    super.key,
    required this.movieName,
    required this.movieDescription,
    required this.monieImgPath,
  });
  final String movieName;
  final String movieDescription;
  final String monieImgPath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Image.asset(
                monieImgPath,
                width: 140,
                height: 140,
                fit: BoxFit.fill,
              ),

              const SizedBox(height: 10),
              Text(
                movieName,
                style: TextStyle(
                  color: MovieColors.white70,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                movieDescription,
                style: TextStyle(
                  color: MovieColors.gray70,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
