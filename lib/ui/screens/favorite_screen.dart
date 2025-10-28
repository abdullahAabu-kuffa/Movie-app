import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/movie_constants.dart';
import 'package:movie_app/core/theme/movie_colors.dart';
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
      backgroundColor: MovieColors.grayDark,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            15,
            50,
            15,
            MediaQuery.of(context).viewPadding.bottom + 24,
          ),
          child: Column(
            children: [
              MovieProfileHeader(),
              const SizedBox(height: 20),
              MovieSearch(),
              const SizedBox(height: 20),
              MovieTitleSection(
                titleSectionPopular: MovieStrings.titleSectionFavorites,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
