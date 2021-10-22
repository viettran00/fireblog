import 'package:thienfire/models/blog_model.dart';

final String data =
    "Flutter là một SDK phát triển ứng dụng di động nguồn mở được tạo ra bởi Google. Nó được sử dụng để phát triển ứng ứng dụng cho Android và iOS, cũng là phương thức chính để tạo ứng dụng cho Google Fuchsia.";

List<Blog> FAKE_BLOG = [
  Blog(
      idBlog: "blog1",
      user: "viet",
      postAgo: "2021-06-14 18:19:28.960250",
      imageURL:
          "https://res.cloudinary.com/dwgsm5xpa/image/upload/v1623743264/ThienUnited/Green_and_Gold_Minimalist_Vegan_Food_Instagram_Post_bc3uvm.png",
      email: "viet@alibabon.net",
      blogTitle: "A new take on vegan",
      blogDescription: data,
      like: 20,
      save: 5,
      comment: 2,
      share: 2),
  Blog(
    idBlog: "blog2",
    user: "thach",
    postAgo: "2021-06-13 18:19:28.960250",
    email: "thach@alibabon.net",
    imageURL:
        "https://res.cloudinary.com/dwgsm5xpa/image/upload/v1623743452/ThienUnited/Black_and_White_Stars_Science_Class_Notebook_Cover_eqmicg.png",
    blogTitle: "Flutter",
    blogDescription: data,
  ),
  Blog(
      idBlog: "blog3",
      user: "user",
      postAgo: "2021-06-14 19:19:28.960250",
      email: "user@alibabon.net",
      imageURL:
          "https://res.cloudinary.com/dwgsm5xpa/image/upload/v1623743574/ThienUnited/Maroon_Burger_Instagram_Post_cjwwfk.png",
      blogTitle: "Food",
      blogDescription: data,
      like: 99,
      save: 99,
      comment: 99,
      share: 55),
];

List<String> FAKE_HISTORY = [
  "Alibabon",
  "Life",
  "thach pham",
  "viet tran",
  "Game",
];
