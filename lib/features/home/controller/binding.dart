import 'package:get/get.dart';
import 'package:starthub_connect/features/blogs/controller/controller.dart';
import 'package:starthub_connect/features/channels/controller/controller.dart';

import 'controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<ChannelsController>(ChannelsController());
    Get.put<BlogsController>(BlogsController());
  }
}
