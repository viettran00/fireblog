class Blog{

  final String idBlog;
  final String user;
  final String postAgo;
  final String email;
  final String imageURL;
  final String? blogTitle;
  final String blogDescription;
   int like;
   int comment;
   int save;
   int share;

  Blog({
    required this.idBlog,
    required this.user,
    required this.postAgo,
    required this.email,
    required this.imageURL,
    this.blogTitle,
    required this.blogDescription,
    this.like = 0,
    this.comment = 0,
    this.save = 0,
    this.share = 0,
  });
}