import 'package:flutter/material.dart';
import 'package:thienfire/screens/signin/signin_screen.dart';
import 'package:thienfire/ultis/global_variable.dart' as globals;
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  final googleSignIn;

  ProfileScreen(this.googleSignIn);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        print(user);
        loggedUser = user;
        print("emai: ${loggedUser.email}");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.googleSignIn);
    return widget.googleSignIn == null
        ? Column(
            // login with google
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${loggedUser.displayName}"),
              Text("${loggedUser.email}"),
              InkWell(
                onTap: () {
                  setState(() {
                    globals.isLoggedIn = false;
                  });

                  Navigator.of(context).pushNamed(SignInScreen.id);
                },
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue,
                      border: Border.all()),
                  width: double.infinity,
                  child: Center(
                    child: Text("Log Out"),
                  ),
                ),
              )
            ],
          )
        : Column(
            // login with google
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                    "${widget.googleSignIn!.currentUser!.photoUrl}"),
              ),
              Text("${widget.googleSignIn!.currentUser!.displayName}"),
              Text("${widget.googleSignIn!.currentUser!.email}"),
              InkWell(
                onTap: () {
                  print("Log Out");
                  widget.googleSignIn!.signOut();
                  setState(() {
                    globals.isLoggedIn = false;
                  });

                  Navigator.of(context).pushNamed(SignInScreen.id);
                },
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue,
                      border: Border.all()),
                  width: double.infinity,
                  child: Center(
                    child: Text("Log Out"),
                  ),
                ),
              )
            ],
          );
  }
}
