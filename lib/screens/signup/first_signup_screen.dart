import 'package:thienfire/components/signin_with_google.dart';
import 'package:thienfire/components/app_logo.dart';
import 'package:thienfire/components/auth_navigate.dart';
import 'package:thienfire/components/copyright.dart';
import 'package:thienfire/components/reusable_button.dart';
import 'package:thienfire/components/reusable_textfield.dart';
import 'package:thienfire/screens/signup/last_signup_screen.dart';
import 'package:thienfire/ultis/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class FirstSignUpScreen extends StatefulWidget {
  static const String id = "first_signup_screen";

  @override
  _FirstSignUpScreenState createState() => _FirstSignUpScreenState();
}

enum Gender { male, female, other }

class _FirstSignUpScreenState extends State<FirstSignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  Gender? _gender = Gender.male;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                Row(
                  children: [
                    Expanded(
                      child: ReusableTextField(
                        hintText: "First name",
                        controller: firstNameController,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: ReusableTextField(
                        hintText: "Last name",
                        controller: lastNameController,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                _buildDateTinePicker(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildRadio(
                        gender: "Male",
                        value: Gender.male,
                        groupValue: _gender),
                    _buildRadio(
                        gender: "Female",
                        value: Gender.female,
                        groupValue: _gender),
                    _buildRadio(
                        gender: "Other",
                        value: Gender.other,
                        groupValue: _gender),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                ReusableButton(
                    titleButton: "Next",
                    function: () {
                      Navigator.of(context).pushNamed(LastSignUpScreen.id);
                    }),
                SizedBox(
                  height: 15.0,
                ),
                AuthNavigate(
                    textButton: "Sign In",
                    title: "Already have an account ",
                    function: () {
                      Navigator.pop(context);
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
    );
  }

  Widget _buildDateTinePicker(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(width: 1.0, color: Colors.black54),
      ),
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            formatDate(selectedDate),
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (Platform.isAndroid) {
                _selectDate(context);
              } else if (Platform.isIOS) {
                buildCupertinoDatePicker(context);
              }
            },
            child: Icon(
              Icons.date_range,
              size: 30.0,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != selectedDate)
                  setState(() {
                    selectedDate = picked;
                  });
              },
              initialDateTime: selectedDate,
              minimumYear: 1900,
              maximumYear: (DateTime.now().year + 1),
            ),
          );
        });
  }

  Widget _buildRadio(
      {required String gender, required Gender value, Gender? groupValue}) {
    return Row(
      children: [
        Text(gender),
        Radio<Gender>(
          value: value,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              _gender = value;
            });
          },
        )
      ],
    );
  }
}
