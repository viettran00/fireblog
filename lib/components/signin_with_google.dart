import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:thienfire/screens/bottombar.dart';
import 'package:thienfire/ultis/global_variable.dart' as globals;


class SignInWithGoogle extends StatefulWidget {
  const SignInWithGoogle({
    Key? key,
  }) : super(key: key);

  @override
  _SignInWithGoogleState createState() => _SignInWithGoogleState();
}

class _SignInWithGoogleState extends State<SignInWithGoogle> {

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        globals.isLoggedIn = true;

      });
    } catch (error) {
      print("error: $error");
    }
  }

    @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "- Or sign in with -",
          style: TextStyle(color: Colors.black54),
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async{
                await _handleSignIn();

                if(globals.isLoggedIn) {
                  Navigator.of(context).pushReplacementNamed(
                      BottomBar.id, arguments: _googleSignIn);
                }
              },
              child: Image.asset("assets/images/logo_google.png",
                  height: 50),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
