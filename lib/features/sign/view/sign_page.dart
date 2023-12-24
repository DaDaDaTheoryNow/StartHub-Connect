import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/features/home/view/home_page.dart';
import 'package:starthub_connect/features/sign/controller/controller.dart';
import 'package:starthub_connect/features/sign/controller/state.dart';
import 'package:starthub_connect/features/sign/view/select_sign_screen.dart';

class SignPage extends GetView<SignController> {
  const SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.state.signStatus) {
        case SignStatus.sign:
          return const SelectSignSceen();
        case SignStatus.home:
          return const HomePage();
      }
    });
  }
}
