import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/movie_constants.dart';
import 'package:movie_app/ui/widgets/movie_popular_card.dart';
import 'package:movie_app/ui/widgets/movie_profile_header.dart';
import 'package:movie_app/ui/widgets/movie_search.dart';
import 'package:movie_app/ui/widgets/movie_title_seaction.dart';
import 'package:movie_app/ui/widgets/movie_tvseries_card.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  int currentIndex = 0;

  void onNavBarTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<MoviePopular>? movies = [
    MoviePopular(
      name: "Movie1",
      description: "About1",
      image: MovieImages.onboarding,
    ),
    MoviePopular(
      name: "Movie2",
      description: "About2",
      image: MovieImages.onboarding,
    ),
    MoviePopular(
      name: "Movie3",
      description: "About3",
      image: MovieImages.onboarding,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          child: Column(
            children: [
              MovieProfileHeader(),
              const SizedBox(height: 20),
              MovieSearch(),
              const SizedBox(height: 20),
              MovieTitleSection(
                titleSectionPopular: MovieStrings.titleSectionPopular,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: movies?.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        MoviePopularCard(
                          movieName: movies![index].name,
                          movieDescription: movies![index].description,
                          monieImgPath: movies![index].image,
                        ),
                        SizedBox(width: movies!.length - 1 == index ? 0 : 20),
                      ],
                    );
                  },
                ),
              ),
              MovieTitleSection(
                titleSectionPopular: MovieStrings.titleSectionTVseries,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: movies?.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        MovieTVSeriesCard(
                          movieName: movies![index].name,
                          movieDescription: movies![index].description,
                          monieImgPath: movies![index].image,
                        ),
                        SizedBox(width: movies!.length - 1 == index ? 0 : 12),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: movies?.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        MoviePopularCard(
                          movieName: movies![index].name,
                          movieDescription: movies![index].description,
                          monieImgPath: movies![index].image,
                        ),
                        SizedBox(width: movies!.length - 1 == index ? 0 : 20),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
