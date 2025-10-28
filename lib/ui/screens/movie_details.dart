import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/movie_colors.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/ui/widgets/movie_button.dart';

class MovieDetails extends StatefulWidget {
  final MovieModel movie;

  const MovieDetails({super.key, required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  void _playMovie() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Playing movie...')));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 1. شريط التطبيق الممتد (SliverAppBar) - تم التعريف أدناه
          _buildSliverAppBar(screenHeight),

          // 2. محتوى تفاصيل الفيلم
          SliverList(
            delegate: SliverChildListDelegate([
              // الدوال المساعدة المستدعاة - تم التعريف أدناه
              _buildMovieInfo(),
              _buildOverviewSection(),
              const SizedBox(height: 30),
              _buildActionButton(),
              const SizedBox(height: 50),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(double screenHeight) {
    return SliverAppBar(
      expandedHeight: screenHeight * 0.6,
      pinned: true,
      backgroundColor: MovieColors.primary,
      iconTheme: const IconThemeData(color: MovieColors.white),

      actions: [
        IconButton(
          onPressed: () {
            /* منطق إضافة للمفضلة */
          },
          icon: const Icon(Icons.favorite_border),
          color: MovieColors.secondary,
          iconSize: 32,
        ),
        const SizedBox(width: 8),
      ],

      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(widget.movie.posterPath!, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [MovieColors.transparent, MovieColors.primary],
                  stops: [0.7, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة 2: عنوان الفيلم والتقييم
  Widget _buildMovieInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.movie.title,
            style: const TextStyle(
              color: MovieColors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(Icons.star, color: MovieColors.secondary, size: 20),
              const SizedBox(width: 5),
               Text(
                widget.movie.voteAverage.toString(),
                style: TextStyle(color: MovieColors.white70, fontSize: 16),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: MovieColors.secondary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'Watch Trailer',
                  style: TextStyle(color: MovieColors.white, fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // دالة 3: قسم القصة/الخلاصة
  Widget _buildOverviewSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overview',
            style: TextStyle(
              color: MovieColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          Text(
            widget.movie.overview,
            style: const TextStyle(
              color: MovieColors.white70,
              fontSize: 16,
              height: 1.5,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  // دالة 4: زر الإجراء الرئيسي
  Widget _buildActionButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MovieButton(nameButton: 'Watch Now', onPressed: _playMovie),
    );
  }
}
