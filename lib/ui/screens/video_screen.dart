import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  int currentIndex = 0;
  void onNavBarTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      // backgroundColor: MovieColors.grayDark,
      // bottomNavigationBar: HomeNavBar(
      //   currentIndexScreen: currentIndex,
      //   onTap: onNavBarTap,
      // ),
    );
  }
}
