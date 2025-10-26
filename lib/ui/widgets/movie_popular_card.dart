import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/movie_colors.dart';

class MoviePopularCard extends StatelessWidget {
  const MoviePopularCard({
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
      width: 260,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  monieImgPath,
                  width: 260,
                  height: 180,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieName,
                    style: TextStyle(
                      color: MovieColors.white70,
                      fontSize: 23,
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
        ],
      ),
    );
  }
}
