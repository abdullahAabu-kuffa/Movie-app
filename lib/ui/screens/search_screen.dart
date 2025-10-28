import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/movie_constants.dart';
import 'package:movie_app/core/theme/movie_colors.dart';
import 'package:movie_app/logic/cubit/search_cubit/search_cubit.dart';
import 'package:movie_app/logic/cubit/search_cubit/search_state.dart';
import 'package:movie_app/ui/widgets/movie_popular_card.dart';
import 'package:movie_app/ui/widgets/movie_title_seaction.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchCubit>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MovieTitleSection(titleSectionPopular: MovieStrings.titleSectionSearch),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SearchFailureState) {
                return Center(child: Text(state.errorMessage));
              } else if (state is SearchSuccessState) {
                final searchMovies = state.searchMovies;
                final results = searchMovies[0].results;
                if (searchMovies.isEmpty || results.isEmpty) {
                  return const Center(
                    child: Text(
                      'No movies found',
                      style: TextStyle(color: MovieColors.white),
                    ),
                  );
                }
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final movie = results[index];
                    return MoviePopularCard(
                      movie: movie
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
  }
}
