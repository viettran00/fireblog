import 'package:thienfire/screens/home_screen/comment_view.dart';
import 'package:thienfire/screens/home_screen/image_view.dart';
import 'package:thienfire/screens/search_screen/result_search_screen.dart';
import 'package:thienfire/screens/signup/first_signup_screen.dart';
import 'package:thienfire/screens/bottombar.dart';
import 'package:thienfire/screens/signup/last_signup_screen.dart';
import 'package:thienfire/screens/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class ThienFire extends StatefulWidget {
  @override
  _ThienFireState createState() => _ThienFireState();
}

class _ThienFireState extends State<ThienFire> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
         print(snapshot.error);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            initialRoute: SignInScreen.id,
            routes: {
              SignInScreen.id: (context) => SignInScreen(),
              FirstSignUpScreen.id: (context) => FirstSignUpScreen(),
              LastSignUpScreen.id: (context) => LastSignUpScreen(),
              BottomBar.id: (context) => BottomBar(),
              ImageView.id: (context) => ImageView(
                argument: ModalRoute.of(context)!.settings.arguments,
              ),
              CommentView.id: (context) => CommentView(
                argument: ModalRoute.of(context)!.settings.arguments,
              ),
              ResultSearchScreen.id: (context) => ResultSearchScreen()
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}
