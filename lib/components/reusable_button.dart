import 'package:thienfire/ultis/constants.dart';
import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String titleButton;
  final Function function;

  ReusableButton({required this.titleButton, required this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Text(
            titleButton,
            style: kTextButton,
          ),
        ),
      ),
    );
  }
}
