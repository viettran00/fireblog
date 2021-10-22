import 'package:thienfire/components/blog_view.dart';
import 'package:thienfire/models/blog_model.dart';
import 'package:thienfire/temp/fake_data.dart';
import 'package:flutter/material.dart';

class ForYouScreen extends StatefulWidget {
  @override
  _ForYouScreenState createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
  @override
  Widget build(BuildContext context) {
    List<Blog> lists = FAKE_BLOG;

    return RefreshIndicator(
      onRefresh: () async {
        var delay = Duration(seconds: 2);
        await Future.delayed(delay);

        print("Refresh data");
      },
      child: Container(
        color: Color(0xB7EFF3ED),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: lists.length,
          itemBuilder: (context, index) {
            return BlogView(blog: lists[index]);
          },
        ),

        // ListView(
        //   children: FAKE_BLOG.map((blog) {
        //     return BlogView(blog: blog);
        //   }).toList(),
      ),
    );
  }
}
