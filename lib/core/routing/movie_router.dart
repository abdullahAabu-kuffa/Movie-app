import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/logic/cubit/movies_cubit/movies_cubit.dart';
import 'package:movie_app/logic/cubit/tvseries_cubit/tvseries_cubit.dart';
import 'package:movie_app/ui/screens/home_screen.dart';
import 'package:movie_app/ui/screens/onboarding_screen.dart';

//app router
class MovieRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<MoviesCubit>(create: (context) => MoviesCubit()),
              BlocProvider<TvSeriesCubit>(create: (context) => TvSeriesCubit()),
            ],
            child: const HomeScreen(),
          ),
        );
      default:
        return null;
    }
  }
}

//the routes of screens
class Routes {
  Routes._();

  static const String initialRoute = '/';
  static const String homeRoute = '/home';
}
