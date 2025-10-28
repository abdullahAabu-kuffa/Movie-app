import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theme/movie_colors.dart';

class MovieSearchItem extends StatelessWidget {
  const MovieSearchItem({
    super.key,
    required this.movieName,
    required this.movieDescription,
    required this.movieImgPath,
  });

  final String movieName;
  final String movieDescription;
  final String movieImgPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: movieImgPath.startsWith('http')
                  ? Image.network(
                      movieImgPath,
                      width: 260,
                      height: 180.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/onboarding.png',
                        width: 260,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          width: 260,
                          height: 180.h,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          ),
                        );
                      },
                    )
                  : Image.asset(
                      movieImgPath,
                      width: 260,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            movieName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: MovieColors.white70,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movieDescription,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: MovieColors.gray70,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
