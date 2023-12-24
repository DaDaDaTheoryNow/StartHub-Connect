import 'package:get/get.dart';
import 'package:starthub_connect/core/models/message.dart';

class ChatState {
  RxList<MessageModel> messages = <MessageModel>[].obs;
  RxString chatTitle = "Unlnown".obs;
  RxBool isLoading = false.obs;
}
