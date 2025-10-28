import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/movie_constants.dart';
import 'package:movie_app/core/theme/movie_colors.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    super.key,
    required this.currentIndexScreen,
    required this.onTap,
  });

  final int currentIndexScreen;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15), // Blur strength
          child: Container(
            decoration: BoxDecoration(
              color: MovieColors.secondary, // translucent
              borderRadius: BorderRadius.circular(40),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent, // use container color
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndexScreen,
              onTap: onTap,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedIconTheme: const IconThemeData(
                color: MovieColors.white70,
                size: 30,
              ),
              unselectedIconTheme: const IconThemeData(
                color: MovieColors.gray,
                size: 28,
              ),
              items: const [
                BottomNavigationBarItem(icon: MovieIcons.homeIcon, label: ""),
                BottomNavigationBarItem(icon: MovieIcons.videoIcon, label: ""),
                BottomNavigationBarItem(
                  icon: MovieIcons.favoriteIcon,
                  label: "",
                ),
                BottomNavigationBarItem(icon: MovieIcons.personIcon, label: ""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
