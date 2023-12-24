import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/features/blogs/view/create_blog.dart';
import 'package:starthub_connect/features/blogs/view/user_blogs_page.dart';
import 'package:starthub_connect/features/chat/controller/binding.dart';
import 'package:starthub_connect/features/chat/view/chat_page.dart';
import 'package:starthub_connect/features/home/controller/binding.dart';
import 'package:starthub_connect/features/home/view/home_page.dart';
import 'package:starthub_connect/features/sign/controller/binding.dart';
import 'package:starthub_connect/features/sign/view/sign_page.dart';

class AppRoutes {
  static const home = "/home";
  static const sign = "/sign";
  static const chat = "/chat";
  static const createBlog = "/create_blog";
  static const userBlogs = "/user_blogs";

  static final List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: chat,
      page: () => const ChatPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: sign,
      page: () => const SignPage(),
      binding: SignBinding(),
      curve: Curves.fastEaseInToSlowEaseOut,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: createBlog,
      page: () => const CreateBlogPage(),
      curve: Curves.fastEaseInToSlowEaseOut,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: userBlogs,
      page: () => const UserBlogsPage(),
      curve: Curves.fastEaseInToSlowEaseOut,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    /*Page(
      name: chat,
      page: () => const SignPage(),
      binding: SignBinding(),
      curve: Curves.fastEaseInToSlowEaseOut,
      transitionDuration: const Duration(milliseconds: 700),
      middlewares: [SignRedirectMiddleware()],
    )*/
  ];
}
