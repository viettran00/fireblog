import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

const kTitleAuthText =
    TextStyle(fontSize: 45.0, color: Colors.black, fontWeight: FontWeight.bold);

const kTitleIntroText = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
    fontWeight: FontWeight.w400
);

const kForgotPasswordText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black38
);

const kTextButton =  TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 22.0
);

String formatDate(DateTime date){
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return formattedDate;
}
DateTime? currentBackPressTime;
Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        Fluttertoast.showToast(msg: "Press back again to exit");
        return Future.value(false);
    }
    return Future.value(true);
}

String getMinutes(String dateTime){
    final difference = DateTime.now().difference(DateTime.parse(dateTime)).inMinutes;

    return difference.toString();
}

String getHours(String dateTime){
    var difference;
    if( int.parse(getMinutes(dateTime))  >= 60){
        difference = DateTime.now().difference(DateTime.parse(dateTime)).inHours;
    }
    return difference.toString();
}

String getDay(String dateTime){
    var difference;
    if( int.parse(getHours(dateTime))  >= 24){
        difference = DateTime.now().difference(DateTime.parse(dateTime)).inDays;
    }
    return difference.toString();
}

String getTimeAgo(String dateTime){
    String result = "";
    if(int.parse(getMinutes(dateTime)) < 60){
        result = getMinutes(dateTime) + " minute";
    }
    else if(int.parse(getHours(dateTime)) < 24){
        result = getHours(dateTime) + " hour";
    }else if(int.parse(getDay(dateTime)) < 31){
        result = getDay(dateTime) + " day";
    }

    // miss case: > 1 month, > 1 year
    return result;
}

