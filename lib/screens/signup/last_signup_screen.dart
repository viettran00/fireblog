import 'package:thienfire/components/signin_with_google.dart';
import 'package:thienfire/components/app_logo.dart';
import 'package:thienfire/components/auth_navigate.dart';
import 'package:thienfire/components/copyright.dart';
import 'package:thienfire/components/reusable_button.dart';
import 'package:thienfire/components/reusable_textfield.dart';
import 'package:thienfire/screens/signin/signin_screen.dart';
import 'package:thienfire/ultis/constants.dart';
import 'package:thienfire/validations/email_validation.dart';
import 'package:thienfire/validations/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LastSignUpScreen extends StatefulWidget {
  static const String id = "last_signup_screen";

  @override
  _LastSignUpScreenState createState() => _LastSignUpScreenState();
}

class _LastSignUpScreenState extends State<LastSignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  bool isObscureTextPassword = true;
  bool isObscureTextRePassword = true;

  bool isEmailError = false;
  bool isPasswordError = false;
  bool isRePasswordError = false;
  bool isAsyncCall = false;


  // final _auth = FirebaseAuth.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isAsyncCall,
      child: GestureDetector(
        onTap: () {
          // click outside to hide keyboard
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppLogo(),
                  Text(
                    "Sign Up",
                    style: kTitleAuthText,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Please fill the details and create an account",
                    style: kTitleIntroText,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ReusableTextField(
                    hintText: "Enter your Email",
                    controller: emailController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    errorText: isEmailError ? "Your email is invalid" : null,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Stack(
                    children: [
                      ReusableTextField(
                        hintText: "Enter your Password",
                        controller: passwordController,
                        obscureText: isObscureTextPassword,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        errorText: isPasswordError
                            ? "At least: 1 Uppercase,1 Lowercase,1 Digits, 1 Special characters"
                            : null,
                      ),
                      Positioned(
                        right: 20.0,
                        top: 17.0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureTextPassword = !isObscureTextPassword;
                            });
                          },
                          child: Icon(isObscureTextPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Stack(
                    children: [
                      ReusableTextField(
                          hintText: "Re-Enter your Password",
                          controller: rePasswordController,
                          obscureText: isObscureTextRePassword,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done),
                      Positioned(
                        right: 20.0,
                        top: 17.0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureTextRePassword = !isObscureTextRePassword;
                            });
                          },
                          child: Icon(isObscureTextRePassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Password must be at least 6 characters",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 12.0),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ReusableButton(
                      titleButton: "Sign Up",
                      function: () {
                        _onSignUp(context);
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  AuthNavigate(
                      textButton: "Sign In",
                      title: "Already have an account ",
                      function: () {
                        Navigator.of(context)
                            .popUntil(ModalRoute.withName(SignInScreen.id));
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  SignInWithGoogle(),
                  Copyright(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onSignUp(BuildContext context) async{
    bool validEmail = EmailValidation(emailController.text).isValidEmail();
    bool validPassword =
        PasswordValidation(passwordController.text).isValidPassword();

    setState(() {
      isEmailError = !validEmail;
      isPasswordError = !validPassword;
    });

    if (validEmail && validPassword) {
      if (passwordController.text.trim() == rePasswordController.text.trim()) {
        try{
          setState(() {
            isAsyncCall = true;
          });
          await _auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text.trim());

          setState(() {
            isAsyncCall = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Sign up successfully")));
            print("success");

          print(emailController.text + "\n" + passwordController.text);
        }catch(err){
          print("err: $err");
        }
      }
    }
  }
}
