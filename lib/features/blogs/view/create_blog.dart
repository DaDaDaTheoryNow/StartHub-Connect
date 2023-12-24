import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/config/theme/app_colors.dart';
import 'package:starthub_connect/core/models/blog.dart';
import 'package:starthub_connect/features/blogs/controller/controller.dart';
import 'package:starthub_connect/features/blogs/view/widgets/blog_text_field.dart';

class CreateBlogPage extends GetView<BlogsController> {
  const CreateBlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Blog'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              children: [
                BlogTextField(
                  hintText: 'Title',
                  icon: Icons.title,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  textEditingController: controller.state.titleController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                BlogTextField(
                  hintText: 'Description',
                  icon: Icons.description,
                  obscureText: false,
                  keyboardType: TextInputType.multiline,
                  textEditingController:
                      controller.state.descriptionController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                BlogTextField(
                  hintText: 'Video Link',
                  icon: Icons.videocam,
                  obscureText: false,
                  keyboardType: TextInputType.url,
                  textEditingController:
                      controller.state.videoLinkController.value,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter a valid video link';
                    }

                    if (value != null &&
                        value.isNotEmpty &&
                        !value.startsWith('http')) {
                      return 'Please enter a valid video link';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kOpacityBlueColor,
                  ),
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      String title =
                          controller.state.titleController.value.text;
                      String description =
                          controller.state.descriptionController.value.text;
                      String videoLink =
                          controller.state.videoLinkController.value.text;

                      formKey.currentState?.reset();

                      controller.createNewBlog(BlogModel(
                          description: description.trim(),
                          title: title.trim(),
                          videoLink: videoLink.trim()));
                    }
                  },
                  child: const Text(
                    'Create Blog',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
