import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/features/blogs/view/widgets/user_drawer.dart';
import 'package:starthub_connect/features/chat/controller/controller.dart';
import 'package:starthub_connect/features/chat/view/widgets/chat_bubble.dart';
import 'package:starthub_connect/features/chat/view/widgets/message_input.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const UserDrawer(),
      appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeft,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Obx(
            () => Text(
              controller.state.chatTitle.value,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => (controller.state.isLoading.value)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : (controller.state.messages.isNotEmpty)
                      ? Padding(
                          padding: EdgeInsets.only(top: 7.h),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: ListView.builder(
                              shrinkWrap: true,
                              reverse: true,
                              itemCount: controller.state.messages.length,
                              itemBuilder: (context, index) {
                                return ChatBubble(
                                    controller.state.messages[index]);
                              },
                            ),
                          ),
                        )
                      : Center(
                          child: Text(
                            "Nothing here :(",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
            ),
          ),
          MessageInputField(
              onSendMessage: (message) => controller.sendMessage(message)),
        ],
      ),
    );
  }
}
