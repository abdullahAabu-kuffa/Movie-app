import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/routing/movie_router.dart';
import 'package:movie_app/core/theme/movie_theme.dart';
import 'package:movie_app/core/constants/movie_constants.dart';
import 'package:movie_app/logic/cubit/movies_cubit/movies_cubit.dart';
import 'package:movie_app/logic/cubit/search_cubit/search_cubit.dart';
import 'package:movie_app/logic/cubit/favorites_cubit/favorites_cubit.dart';
import 'package:movie_app/logic/cubit/tvseries_cubit/tvseries_cubit.dart';
import 'package:movie_app/logic/cubit/video_cubit/video_cubit.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<MoviesCubit>(create: (context) => MoviesCubit()),
        BlocProvider<TvSeriesCubit>(create: (context) => TvSeriesCubit()),
        BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
        BlocProvider<FavoritesCubit>(create: (context) => FavoritesCubit()),
        BlocProvider<VideoCubit>(create: (context) => VideoCubit()),
      ],
      child: const MovieApp(),
    ),
  );
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
