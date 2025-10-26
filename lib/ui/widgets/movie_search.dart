import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/movie_constants.dart';
import 'package:movie_app/core/theme/movie_colors.dart';

class MovieSearch extends StatefulWidget {
  const MovieSearch({super.key});

  @override
  State<MovieSearch> createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

   @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {});
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return     TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: MovieStrings.hintSearchString,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: MovieColors.gray70,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(Icons.search, color: MovieColors.primary),
                  ),
                  filled: true,
                  fillColor: MovieColors.gray,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: MovieColors.white70),
                onChanged: (value) {
                  // Handle search logic here
                },
              );
  }
}