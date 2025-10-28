import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/movie_constants.dart';
import 'package:movie_app/core/networking/api_constants.dart';
import 'package:movie_app/core/theme/movie_colors.dart';
import 'package:movie_app/logic/cubit/TvSeries_cubit/TvSeries_state.dart';
import 'package:movie_app/logic/cubit/movies_cubit/movies_cubit.dart';
import 'package:movie_app/logic/cubit/movies_cubit/movies_state.dart';
import 'package:movie_app/logic/cubit/search_cubit/search_cubit.dart';
import 'package:movie_app/logic/cubit/search_cubit/search_state.dart';
import 'package:movie_app/logic/cubit/tvseries_cubit/tvseries_cubit.dart';
import 'package:movie_app/ui/screens/search_screen.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //movies
      final moviescubit = context.read<MoviesCubit>();
      moviescubit.getMovies();
      //tv series
      final tvSeriesCubit = context.read<TvSeriesCubit>();
      tvSeriesCubit.getTvSeries();
    });
  }

  void onNavBarTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MovieColors.grayDark,
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
                          titleSectionPopular: MovieStrings.titleSectionPopular,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 280.h,
                          child: BlocBuilder<MoviesCubit, MoviesState>(
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
                                return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: results.length,
                                  itemBuilder: (context, index) {
                                    final movie = results[index];

                                    final imagePath = movie.posterPath != null
                                        ? '${ApiConstants.imageBaseUrl}${movie.posterPath}'
                                        : MovieImages.onboarding;
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right: index == results.length - 1
                                            ? 0
                                            : 20,
                                      ),
                                      child: MoviePopularCard(
                                        movieName: movie.title,
                                        movieDescription:
                                            movie.originalTitle.isNotEmpty
                                            ? movie.originalTitle
                                            : movie.title,
                                        movieImgPath: imagePath,
                                      ),
                                    );
                                  },
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                        MovieTitleSection(
                          titleSectionPopular:
                              MovieStrings.titleSectionTVseries,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 220.h,
                          child: BlocBuilder<TvSeriesCubit, TvSeriesState>(
                            builder: (context, state) {
                              if (state is TvSeriesLoadingState) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is TvSeriesFailureState) {
                                return Center(child: Text(state.errorMessage));
                              } else if (state is TvSeriesSuccessState) {
                                final tvSeriesList = state.tvSeries;
                                if (tvSeriesList.isEmpty) {
                                  return const Center(
                                    child: Text('No movies found'),
                                  );
                                }
                                final results = tvSeriesList[0].results;
                                return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: results.length,
                                  itemBuilder: (context, index) {
                                    final tvSeries = results[index];
                                    final imagePath =
                                        tvSeries.posterPath != null
                                        ? '${ApiConstants.imageBaseUrl}${tvSeries.posterPath}'
                                        : MovieImages.onboarding;
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right: index == results.length - 1
                                            ? 0
                                            : 15,
                                      ),
                                      child: MovieTVSeriesCard(
                                        movieName: tvSeries.title,
                                        movieDescription:
                                            tvSeries.originalTitle,
                                        movieImgPath: imagePath,
                                      ),
                                    );
                                  },
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
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
