import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/features/blogs/controller/controller.dart';
import 'package:starthub_connect/features/blogs/view/widgets/blog_widget.dart';

class UserBlogsPage extends GetView<BlogsController> {
  const UserBlogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => (!controller.state.isUserBlogsLoading.value)
            ? (controller.state.userBlogs.isNotEmpty)
                ? ListView.builder(
                    itemCount: controller.state.userBlogs.length,
                    itemBuilder: (context, index) {
                      return BlogWidget(
                          blog: controller.state.userBlogs[index]);
                    },
                  )
                : Center(
                    child: Text(
                      "The user has not created any blogs",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
