import 'package:thienfire/screens/home_screen/trending_screen.dart';
import 'package:thienfire/screens/home_screen/for_you_screen.dart';
import 'package:thienfire/screens/home_screen/like_screen.dart';
import 'package:thienfire/screens/home_screen/saved_screen.dart';
import 'package:flutter/material.dart';

class HomeTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        ForYouScreen(),
        FollowingScreen(),
        LikeScreen(),
        SavedScreen()
      ],
    );
  }
}
