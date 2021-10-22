import 'package:thienfire/models/blog_model.dart';
import 'package:thienfire/screens/home_screen/comment_view.dart';
import 'package:thienfire/screens/home_screen/image_view.dart';
import 'package:flutter/material.dart';
import 'package:thienfire/ultis/constants.dart';
import 'package:readmore/readmore.dart';

class BlogView extends StatefulWidget {
  @override
  _BlogViewState createState() => _BlogViewState();

  final Blog blog;

  BlogView({required this.blog});
}

class _BlogViewState extends State<BlogView> {
  bool isLike = false;
  DateTime getTime = DateTime.parse("2021-06-14 18:19:28.960250");

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              children: [
                Text(
                  widget.blog.user,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text("${getTimeAgo(widget.blog.postAgo)} ago"),
                Icon(
                  Icons.timer,
                  size: 13.0,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 10, 10),
            child: Text(
              widget.blog.email,
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ),
          GestureDetector(
            onTap: () {
              //await showDialog(context: context, builder: (_) => imageDialog());
              Navigator.of(context).pushNamed(ImageView.id,
                  arguments: {"imageURL": widget.blog.imageURL});
            },
            // child: Image.asset("assets/images/logo_fireblog.png"),
            child: Image.network(widget.blog.imageURL),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                widget.blog.blogTitle ?? '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: ReadMoreText(
              widget.blog.blogDescription,
              //trimExpandedText: 'less',
              //trimCollapsedText: 'more',
              trimLength: 150,
              lessStyle: TextStyle(
                color: Colors.grey,
              ),
              moreStyle: TextStyle(
                color: Colors.grey,
              ),
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLike = !isLike;
                          isLike
                              ? widget.blog.like += 1
                              : widget.blog.like -= 1;
                        });
                      },
                      child: Icon(
                        isLike ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                    Text(widget.blog.like.toString()),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //print(getTimeAgo("2021-05-13 18:19:28.960250"));
                        Navigator.of(context).pushNamed(
                          CommentView.id,
                          arguments: widget.blog,
                        );
                      },
                      child: Icon(Icons.mode_comment),
                    ),
                    Text(widget.blog.comment.toString()),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.save),
                    Text(widget.blog.save.toString()),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.share),
                    Text(widget.blog.share.toString()),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget imageDialog() {
    return Dialog(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.blog.imageURL), fit: BoxFit.cover)),
      ),
    );
  }
}
