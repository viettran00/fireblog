import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "ThienFire © Thien United Corporation",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
