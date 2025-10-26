import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/movie_colors.dart';

class MovieButton extends StatelessWidget {
  const MovieButton({
    super.key,
    required this.nameButton,
    required this.onPressed,
    this.bgColorButton = MovieColors.secondary,
  });
  final String nameButton;
  final Color bgColorButton;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColorButton,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          nameButton,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
