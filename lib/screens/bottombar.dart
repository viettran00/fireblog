import 'package:thienfire/screens/home_screen/home_tabbarview.dart';
import 'package:thienfire/screens/profile_screen/profile_screen.dart';
import 'package:thienfire/screens/search_screen/first_search_screen.dart';
import 'package:thienfire/ultis/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';


class BottomBar extends StatefulWidget {
  static const String id = "home_screen";

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final googleLogin = ModalRoute.of(context)!.settings.arguments  ?? null;


    PreferredSizeWidget _homeAppBar = AppBar(
      backgroundColor: Colors.white,
      leadingWidth: 100.0,
      leading: Center(
        child: Text(
          "ThienFire",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        Image.asset(
          "assets/images/logo_fireblog.png",
          height: 35.0,
          width: 35.0,
        ),
        SizedBox(
          width: 10.0,
        ),
        Icon(Icons.add, color: Colors.black),
        SizedBox(
          width: 15.0,
        ),
      ],
      bottom: TabBar(
        labelColor: Colors.red,
        unselectedLabelColor: Colors.black,
        indicatorColor: Colors.red,
        indicatorWeight: 2.0,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        tabs: [
          Tab(
            text: "For you",
          ),
          Tab(
            text: "Trending",
          ),
          Tab(
            text: "Like",
          ),
          Tab(
            text: "Saved",
          ),
        ],
      ),
    );

    /*
    PreferredSizeWidget _searchAppBar = AppBar(
      backgroundColor: Colors.white,
      leadingWidth: 100.0,
      leading: Center(
        child: Text(
          "ThienFire",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
*/
    PreferredSizeWidget? buildAppBar(int index) {
      if (index == 0) {
        return _homeAppBar;
      }

      return null;
    }

    // display tabs
    final tabs = [
      HomeTabBarView(),
      FirstSearchScreen(),
      Center(
        child: Text("chat"),
      ),
      Center(
        child: Text("notification"),
      ),
      //ProfileScreen(googleSignIn: googleSignIn,),
      ProfileScreen(googleLogin),
    ];

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: buildAppBar(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.red,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
        body: SafeArea(
          child: WillPopScope(
            onWillPop: () => onWillPop(),
            child: tabs[_currentIndex],
          ),
        ),
      ),
    );
  }
}
