import 'package:thienfire/components/signin_with_google.dart';
import 'package:thienfire/components/app_logo.dart';
import 'package:thienfire/components/auth_navigate.dart';
import 'package:thienfire/components/copyright.dart';
import 'package:thienfire/components/reusable_button.dart';
import 'package:thienfire/components/reusable_textfield.dart';
import 'package:thienfire/screens/signup/first_signup_screen.dart';
import 'package:thienfire/ultis/constants.dart';
import 'package:thienfire/validations/email_validation.dart';
import 'package:thienfire/validations/password_validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../bottombar.dart';

class SignInScreen extends StatefulWidget {
  static const String id = "signin_screen";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  bool isObscureText = true;
  bool isEmailError = false;
  bool isPasswordError = false;

  bool isAsyncCall = false;

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
          body: WillPopScope(
            onWillPop: () => onWillPop(),
            child: SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppLogo(),
                    Text(
                      "Sign In",
                      style: kTitleAuthText,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "Please login to continue using your app",
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
                          obscureText: isObscureText,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          errorText: isPasswordError
                              ? "Password at least 6 characters"
                              : null,
                        ),
                        Positioned(
                          right: 20.0,
                          top: 17.0,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(isObscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Forgot password");
                          },
                          child: Text(
                            "Forgot password?",
                            style: kForgotPasswordText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ReusableButton(
                      titleButton: 'Sign In',
                      function: () => _onLogin(context),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    AuthNavigate(
                      title: "Don't have an account ?",
                      textButton: "Sign Up",
                      function: () {
                        Navigator.of(context).pushNamed(FirstSignUpScreen.id);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SignInWithGoogle(),
                    Copyright(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onLogin(BuildContext context) async{
    bool validEmail = EmailValidation(emailController.text).isValidEmail();
    bool validPassword =
        PasswordValidation(passwordController.text).isValidPassword();
    setState(() {
      isEmailError = !validEmail;
      isPasswordError = !validPassword;
    });
/*
    bool flag = false;
    if(validEmail && validPassword){
      FAKE_LOGIN.forEach((element) { 
        if(element.email == emailController.text && element.password == passwordController.text){
          flag = true;
        }
      });
    }
    if(flag){
      Navigator.of(context).pushReplacementNamed(BottomBar.id);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email or Password is incorrect"))
      );
    }
  */
    //Navigator.of(context).pushReplacementNamed(BottomBar.id);

    setState(() {
      isAsyncCall = true;
    });
    try{
      await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text);
      setState(() {
        isAsyncCall = false;
      });
      Navigator.of(context).pushReplacementNamed(BottomBar.id);
    }
    catch(e){
      setState(() {
        isAsyncCall = false;
      });
      print(e);
    }
  }
}
