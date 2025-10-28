import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/movie_constants.dart';
import 'package:movie_app/core/theme/movie_colors.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/logic/cubit/favorites_cubit/favorites_cubit.dart';
import 'package:movie_app/logic/cubit/search_cubit/search_cubit.dart';
import 'package:movie_app/logic/cubit/search_cubit/search_state.dart';
import 'package:movie_app/ui/screens/search_screen.dart';
import 'package:movie_app/ui/widgets/movie_popular_card.dart';
import 'package:movie_app/ui/widgets/movie_profile_header.dart';
import 'package:movie_app/ui/widgets/movie_search.dart';
import 'package:movie_app/ui/widgets/movie_title_seaction.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoritesScreen> {
  int currentIndex = 0;
  void onNavBarTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 5),
          child: Column(
            children: [
              MovieProfileHeader(),
              const SizedBox(height: 20),
              MovieSearch(),
              const SizedBox(height: 20),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, searchState) {
                  if (searchState is SearchInitialState) {
                    return Column(
                      children: [
                        MovieTitleSection(
                          titleSectionPopular:
                              MovieStrings.titleSectionFavorites,
                        ),
                        const SizedBox(height: 20),
                        BlocBuilder<FavoritesCubit, List<MovieModel>>(
                          builder: (context, favorites) {
                            if (favorites.isEmpty) {
                              return const Center(
                                child: Text(
                                  'No favorites added.',
                                  style: TextStyle(color: MovieColors.white70),
                                ),
                              );
                            }
                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: favorites.length,
                              itemBuilder: (context, index) {
                                final movie = favorites[index];
                                return MoviePopularCard(movie: movie);
                              },
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return SearchScreen();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
