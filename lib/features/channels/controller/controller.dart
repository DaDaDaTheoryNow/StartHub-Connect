import 'dart:async';

import 'package:get/get.dart';
import 'package:starthub_connect/core/models/channel.dart';
import 'package:starthub_connect/features/channels/controller/state.dart';

import 'package:firebase_database/firebase_database.dart';

class ChannelsController extends GetxController {
  final state = ChannelsState();

  final DatabaseReference _channelsRef =
      FirebaseDatabase.instance.ref().child('channels');

  void updateChannels(Map<dynamic, dynamic> channelsData) {
    final List<ChannelModel> parsedChannels = channelsData.entries
        .map((entry) => ChannelModel.fromFirebase(entry))
        .toList();

    state.channels.assignAll(parsedChannels);
  }

  @override
  void onInit() {
    _subscribeToChannels();
    super.onInit();
  }

  late StreamSubscription subscribeToChat;
  void _subscribeToChannels() {
    subscribeToChat = _channelsRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        updateChannels(event.snapshot.value as Map<Object?, Object?>);
      }
    });
  }

  @override
  void onClose() {
    subscribeToChat.cancel();
    super.onClose();
  }
}
