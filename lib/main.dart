import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/routing/movie_router.dart';
import 'package:movie_app/core/theme/movie_theme.dart';
import 'package:movie_app/core/constants/movie_constants.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: MovieStrings.movieTitle,

        //movie theme
        theme: MovieTheme.theme,

        //all routes of movie
        initialRoute: Routes.initialRoute,
        onGenerateRoute: MovieRouter.generateRoute,
      ),
    );
  }
}
