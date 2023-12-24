import 'package:starthub_connect/core/models/message.dart';

class ChatModel {
  final String title;
  final List<MessageModel> messages;

  ChatModel({
    required this.title,
    required this.messages,
  });

  static Future<ChatModel> fromFirebase(
      Map<dynamic, dynamic> channelsData) async {
    return ChatModel(
      title: channelsData.keys.firstOrNull ?? 'Unknown',
      messages: (channelsData["messages"] != null)
          ? await Future.wait(
              channelsData["messages"].entries.map<Future<MessageModel>>(
                (entry) async {
                  return MessageModel.fromFirebase(entry.value);
                },
              ),
            )
          : [],
    );
  }
}
