import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/core/models/message.dart';
import 'package:starthub_connect/features/chat/controller/controller.dart';

class ChatBubble extends GetView<ChatController> {
  final MessageModel messageModel;
  const ChatBubble(this.messageModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 10.w),
          (FirebaseAuth.instance.currentUser!.uid != messageModel.user.uid)
              ? InkWell(
                  borderRadius: BorderRadius.circular(5.r),
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                    controller.goToProfile(messageModel.user);
                  },
                  child: CachedNetworkImage(
                    imageUrl: messageModel.user.image,
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      radius: 20.r,
                      backgroundImage: imageProvider,
                    ),
                    placeholder: (context, url) => CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.grey,
                    ),
                    errorWidget: (context, url, error) => CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.red,
                    ),
                  ),
                )
              : const SizedBox(),
          Expanded(
            child: BubbleNormal(
              text: messageModel.text,
              isSender: FirebaseAuth.instance.currentUser!.uid ==
                  messageModel.user.uid,
              color: (FirebaseAuth.instance.currentUser!.uid ==
                      messageModel.user.uid)
                  ? const Color(0xFF1B97F3)
                  : const Color.fromARGB(255, 109, 110, 112),
              tail: true,
              textStyle: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
