import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/core/models/blog.dart';

class BlogsState {
  RxList<BlogModel> blogs = <BlogModel>[].obs;

  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  Rx<TextEditingController> videoLinkController = TextEditingController().obs;

  RxList<BlogModel> userBlogs = <BlogModel>[].obs;
  RxString userAvatarUrl = "".obs;
  RxBool isUserBlogsLoading = false.obs;
}
