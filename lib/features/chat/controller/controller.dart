import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/core/models/channel.dart';
import 'package:starthub_connect/core/models/chat.dart';
import 'package:starthub_connect/core/models/message.dart';
import 'package:starthub_connect/core/models/user.dart';
import 'package:starthub_connect/features/blogs/controller/controller.dart';

import 'state.dart';

class ChatController extends GetxController {
  final state = ChatState();

  void sendMessage(String message) async {
    DatabaseReference messagesRef = FirebaseDatabase.instance
        .ref()
        .child('channels/${state.chatTitle.value}/messages');

    DatabaseReference lastMessageRef = FirebaseDatabase.instance
        .ref()
        .child('channels/${state.chatTitle.value}/lastMessage');

    DatabaseReference newMessageRef = messagesRef.push();
    await newMessageRef.set(MessageModel.toFirebase(message));
    await lastMessageRef.set("last message: $message");
  }

  void goToProfile(UserModel user) {
    Get.find<BlogsController>().getUserBlogs(user);
  }

  void updateChat(Map<dynamic, dynamic> channelsData) async {
    final ChatModel parsedChat = await ChatModel.fromFirebase(channelsData);

    parsedChat.messages.sort((a, b) =>
        a.time.millisecondsSinceEpoch.compareTo(b.time.millisecondsSinceEpoch));

    state.messages.value = parsedChat.messages.reversed.toList();

    state.isLoading.value = false;
  }

  @override
  void onInit() {
    final ChannelModel chatModel = Get.arguments;
    state.chatTitle.value = chatModel.title;

    _subscribeToChat(
      FirebaseDatabase.instance.ref().child("channels/${chatModel.title}"),
    );

    super.onInit();
  }

  late StreamSubscription subscribeToChat;
  void _subscribeToChat(DatabaseReference chatRef) {
    state.isLoading.value = true;
    subscribeToChat = chatRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        updateChat(event.snapshot.value as Map<Object?, Object?>);
      }
    });
  }

  @override
  void onClose() {
    subscribeToChat.cancel();
    super.onClose();
  }
}
