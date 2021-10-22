import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CommentView extends StatelessWidget {
  static const String id = "comment_view";

  final argument;

  const CommentView({required this.argument});

  @override
  Widget build(BuildContext context) {
    print(argument.imageURL);
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          hintText: "Write your comment",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0)
                          )
                      ),
                    ),
                  ),
                ),
                Icon(Icons.send,color: Colors.blue,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
