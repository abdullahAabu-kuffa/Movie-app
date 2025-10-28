import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/movie_constants.dart';
import 'package:movie_app/core/theme/movie_colors.dart';

class MovieProfileHeader extends StatefulWidget {
  const MovieProfileHeader({super.key});

  @override
  State<MovieProfileHeader> createState() => _MovieProfileHeaderState();
}

class _MovieProfileHeaderState extends State<MovieProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                        backgroundImage: AssetImage(MovieImages.profileImage),
                      ),

                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Abdullah AbdelGhaffar",
                            style: TextStyle(
                              color: MovieColors.white70,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Enjoy For Your Favorite Movie",
                            style: TextStyle(
                              color: MovieColors.gray,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.notifications, color: MovieColors.white70),
                ],
              );
  }
}