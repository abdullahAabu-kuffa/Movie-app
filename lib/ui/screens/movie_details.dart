import 'package:flutter/material.dart';
// تأكد من ضبط المسارات التالية لتتناسب مع مشروعك
import 'package:movie_app/core/constants/movie_constants.dart'; 
import 'package:movie_app/core/theme/movie_colors.dart';
import 'package:movie_app/ui/widgets/movie_button.dart'; 

// *****************************************************************
// تم ترك هذه الكلاسات هنا لضمان عدم وجود أخطاء في الـ imports
// *****************************************************************

class MoviePopular {
  final String name;
  final String description;
  final String image;

  MoviePopular({
    required this.name,
    required this.description,
    required this.image,
  });
}

class MovieColors {
  MovieColors._();
  static const Color primary = Color(0xFF000000);
  static const Color secondary = Color(0xFFCD3E10);
  static const Color white = Color(0xFFFFFFFF);
  static const Color white70 = Color(0xB3FFFFFF);
  static const Color gray = Color(0xFF4D4C4C);
  static const Color gray70 = Color(0xFF7C7C7C);
  static const Color grayDark = Color(0xFF1B1B1B);
  static const Color transparent = Colors.transparent;
}
// *****************************************************************

class MovieDetails extends StatefulWidget {
  final MoviePopular movie; 

  const MovieDetails({super.key, required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  
  // دالة وهمية لزر التشغيل
  void _playMovie() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Playing movie...')),
    );
  }

  // ********** دالة البناء الرئيسية **********
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: MovieColors.primary, 
      
      body: CustomScrollView(
        slivers: [
          // 1. شريط التطبيق الممتد (SliverAppBar) - تم التعريف أدناه
          _buildSliverAppBar(screenHeight),

          // 2. محتوى تفاصيل الفيلم
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // الدوال المساعدة المستدعاة - تم التعريف أدناه
                _buildMovieInfo(),
                _buildOverviewSection(),
                const SizedBox(height: 30),
                _buildActionButton(),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------------------------------
  // ********** الدوال المساعدة (Helper Functions) - حل مشكلة الـ Error **********
  // --------------------------------------------------------------------------

  // دالة 1: شريط التطبيق الممتد مع صورة الفيلم
  Widget _buildSliverAppBar(double screenHeight) {
    return SliverAppBar(
      expandedHeight: screenHeight * 0.6, 
      pinned: true, 
      backgroundColor: MovieColors.primary,
      iconTheme: const IconThemeData(color: MovieColors.white), 
      
      actions: [
        IconButton(
          onPressed: () { /* منطق إضافة للمفضلة */ },
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
            Image.asset(
              widget.movie.image, 
              fit: BoxFit.cover,
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    MovieColors.transparent,
                    MovieColors.primary, 
                  ],
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
            widget.movie.name,
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
              const Text(
                '8.5/10', 
                style: TextStyle(
                  color: MovieColors.white70,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: MovieColors.secondary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'Watch Trailer',
                  style: TextStyle(color: MovieColors.white, fontSize: 14),
                ),
              )
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
            widget.movie.description, 
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
      child: MovieButton(
        nameButton: 'Watch Now',
        onPressed: _playMovie,
      ),
    );
  }
}