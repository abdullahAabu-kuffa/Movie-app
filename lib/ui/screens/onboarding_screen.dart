import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/movie_constants.dart';
import 'package:movie_app/core/theme/movie_colors.dart';
import 'package:movie_app/ui/widgets/movie_button.dart';
import 'package:movie_app/ui/widgets/movie_wel_icon.dart';
import 'package:movie_app/ui/widgets/movie_wel_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MovieColors.primary,
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 0),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(MovieImages.onboarding, fit: BoxFit.cover),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MovieWelIcon(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            MovieWelText(),
                            const SizedBox(height: 20),
                            MovieButton(
                              nameButton: MovieStrings.signinString,
                              onPressed: () {
                                Navigator.pushReplacementNamed(context,'/home');
                              },
                            ),
                            const SizedBox(height: 20),
                            MovieButton(
                              nameButton: MovieStrings.signinByGoogleString,
                              bgColorButton: MovieColors.gray,
                              onPressed: () {
                                Navigator.pushReplacementNamed(context,'/home');
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
