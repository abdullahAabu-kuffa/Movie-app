import 'package:flutter/material.dart';

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
      // resizeToAvoidBottomInset: true,
      // backgroundColor: MovieColors.grayDark,
      // bottomNavigationBar: HomeNavBar(currentIndexScreen: currentIndex,
      // onTap: onNavBarTap,
      // ),
    );
  }
}
