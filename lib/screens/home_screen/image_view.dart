import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  static const String id = "image_view";

  final argument;
  ImageView({required this.argument});


  @override
  Widget build(BuildContext context) {

    print(argument["imageURL"]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: PhotoView(
        imageProvider: NetworkImage(argument["imageURL"]),
        minScale: PhotoViewComputedScale.contained,
      ),
    );
  }
}
