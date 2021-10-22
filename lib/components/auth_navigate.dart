import 'package:flutter/material.dart';

class AuthNavigate extends StatelessWidget {

  final String title;
  final String textButton;
  final Function function;

  AuthNavigate({
    required this.textButton,
    required this.title,
    required this.function
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(title,style: TextStyle(
            fontSize: 16.0,
            color: Colors.black54
        ),),
        GestureDetector(
          onTap: () => function(),
          child: Text(textButton,style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xfff809cc)
          ),),
        )
      ],
    );
  }
}
