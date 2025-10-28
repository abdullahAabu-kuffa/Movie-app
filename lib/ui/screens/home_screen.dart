import 'package:flutter/material.dart';
import 'package:movie_app/ui/screens/favorite_screen.dart';
import 'package:movie_app/ui/screens/movies_screen.dart';
import 'package:movie_app/ui/screens/profile_screen.dart';
import 'package:movie_app/ui/screens/video_screen.dart';
import 'package:movie_app/ui/widgets/home_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    MoviesScreen(),
    VideoScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  void onNavBarTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: HomeNavBar(
        currentIndexScreen: currentIndex,
        onTap: onNavBarTap,
      ),
      body: IndexedSemantics(index: currentIndex, child: screens[currentIndex],),
    );
  }
}
