import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/config/theme/app_colors.dart';
import 'package:starthub_connect/core/models/blog.dart';
import 'package:starthub_connect/features/blogs/controller/controller.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogWidget extends GetView<BlogsController> {
  final BlogModel blog;

  const BlogWidget({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kOpacityBlueColor,
      elevation: 3,
      margin: EdgeInsets.all(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 8.w, top: 10.h),
            child: Text(
              blog.title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 8.w, bottom: 10.h),
            child: Text(
              blog.description,
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          if (blog.videoLink.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnyLinkPreview(
                link: blog.videoLink,
                displayDirection: UIDirection.uiDirectionHorizontal,
                showMultimedia: true,
                bodyMaxLines: 5,
                bodyTextOverflow: TextOverflow.ellipsis,
                titleStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                placeholderWidget: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: const CircularProgressIndicator(),
                  ),
                ),
                bodyStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                errorBody: 'Show my custom error body',
                errorTitle: 'Show my custom error title',
                errorWidget: Container(
                  alignment: Alignment.center,
                  color: Colors.grey[300],
                  child: const Text('Oops!'),
                ),
                errorImage: "https://google.com/",
                cache: const Duration(days: 0),
                backgroundColor: Colors.white,
                borderRadius: 12,
                removeElevation: false,
                boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.grey)],
                onTap: () async {
                  await launchUrl(Uri.parse(blog.videoLink));
                },
              ),
            )
        ],
      ),
    );
  }
}
