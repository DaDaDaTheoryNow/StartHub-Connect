import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/config/theme/app_colors.dart';
import 'package:starthub_connect/features/blogs/controller/controller.dart';
import 'package:starthub_connect/features/blogs/view/widgets/blog_widget.dart';

class MyBlogsPage extends GetView<BlogsController> {
  const MyBlogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => (controller.state.blogs.isNotEmpty)
            ? ListView.builder(
                itemCount: controller.state.blogs.length,
                itemBuilder: (context, index) {
                  return (index == controller.state.blogs.length - 1)
                      ? Column(
                          children: [
                            Slidable(
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      flex: 2,
                                      borderRadius: BorderRadius.circular(20.r),
                                      onPressed: (_) {
                                        controller.deleteFromBlogs(controller
                                            .state.blogs[index].blogKey!);
                                      },
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ],
                                ),
                                child: BlogWidget(
                                    blog: controller.state.blogs[index])),
                            SizedBox(
                              height: 60.h,
                            )
                          ],
                        )
                      : BlogWidget(blog: controller.state.blogs[index]);
                },
              )
            : Center(
                child: FloatingActionButton.extended(
                  icon:
                      const FaIcon(FontAwesomeIcons.plus, color: Colors.white),
                  label: Text(
                    "New Blog",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  backgroundColor: kBlueColor,
                  onPressed: () {
                    Get.offNamedUntil("create_blog", (route) => true);
                  },
                ),
              ),
      ),
      floatingActionButton: Obx(() => (controller.state.blogs.isNotEmpty)
          ? FloatingActionButton.extended(
              icon: const FaIcon(FontAwesomeIcons.plus, color: Colors.white),
              label: Text(
                "New Blog",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              backgroundColor: kBlueColor,
              onPressed: () {
                Get.offNamedUntil("create_blog", (route) => true);
              },
            )
          : const SizedBox()),
    );
  }
}
