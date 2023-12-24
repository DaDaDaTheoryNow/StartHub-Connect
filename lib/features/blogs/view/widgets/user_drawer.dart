import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/config/theme/app_colors.dart';
import 'package:starthub_connect/features/blogs/controller/controller.dart';
import 'package:starthub_connect/features/blogs/view/user_blogs_page.dart';

class UserDrawer extends GetView<BlogsController> {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              color: kOpacityBlueColor,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.xmark,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Obx(() => CachedNetworkImage(
                          imageUrl: controller.state.userAvatarUrl.value,
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            backgroundImage: imageProvider,
                          ),
                          placeholder: (context, url) => const CircleAvatar(
                            backgroundColor: Colors.grey,
                          ),
                          errorWidget: (context, url, error) =>
                              const CircleAvatar(
                            backgroundColor: Colors.red,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: UserBlogsPage()),
        ],
      ),
    );
  }
}
