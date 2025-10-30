import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/movie_constants.dart';
import 'package:movie_app/logic/cubit/movies_cubit/movies_cubit.dart';
import 'package:movie_app/logic/cubit/movies_cubit/movies_state.dart';
import 'package:movie_app/logic/cubit/search_cubit/search_cubit.dart';
import 'package:movie_app/logic/cubit/search_cubit/search_state.dart';
import 'package:movie_app/ui/screens/search_screen.dart';
import 'package:movie_app/ui/widgets/movie_popular_card.dart';
import 'package:movie_app/ui/widgets/movie_profile_header.dart';
import 'package:movie_app/ui/widgets/movie_search.dart';
import 'package:movie_app/ui/widgets/movie_title_seaction.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
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
                              MovieStrings.titleSectionAllMovies,
                        ),
                        const SizedBox(height: 20),
                        BlocBuilder<MoviesCubit, MoviesState>(
                          builder: (context, state) {
                            if (state is MoviesLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is MoviesFailureState) {
                              return Center(child: Text(state.errorMessage));
                            } else if (state is MoviesSuccessState) {
                              final moviesList = state.movies;
                              if (moviesList.isEmpty) {
                                return const Center(
                                  child: Text('No movies found'),
                                );
                              }
                              final results = moviesList[0].results;
                              return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: results.length,
                                itemBuilder: (context, index) {
                                  final movie = results[index];
                                  return MoviePopularCard(movie: movie);
                                },
                              );
                            }
                            return const SizedBox.shrink();
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
