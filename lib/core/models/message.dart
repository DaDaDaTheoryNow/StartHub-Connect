import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/core/models/user.dart';
import 'package:starthub_connect/services/storage_service.dart';

class MessageModel {
  final String text;
  final UserModel user;
  final DateTime time;

  MessageModel({
    required this.text,
    required this.user,
    required this.time,
  });

  static Future<MessageModel> fromFirebase(Map<dynamic, dynamic> data) async {
    UserModel user = UserModel(image: "", name: "", uid: "");

    if (data["userUid"] == FirebaseAuth.instance.currentUser!.uid) {
      user = UserModel(
          image: FirebaseAuth.instance.currentUser!.photoURL!,
          name: FirebaseAuth.instance.currentUser!.displayName!,
          uid: FirebaseAuth.instance.currentUser!.uid);
    } else {
      final StorageService storageService = Get.find();

      DatabaseEvent databaseEvent = await FirebaseDatabase.instance
          .ref()
          .child('users/${data["userUid"]}')
          .once();

      final value = databaseEvent.snapshot.value as Map<dynamic, dynamic>;
      final photoUrl = await storageService.getUserPhotoUrl(data["userUid"]);

      user = UserModel(
          image: photoUrl ?? "",
          name: value["name"],
          uid: databaseEvent.snapshot.key!);
    }

    return MessageModel(
      text: data['text'],
      time: DateTime.fromMillisecondsSinceEpoch(data["time"]),
      user: user,
    );
  }

  static Map<String, dynamic> toFirebase(String textToSend) {
    return {
      'text': textToSend,
      'time': ServerValue.timestamp,
      'userUid': FirebaseAuth.instance.currentUser!.uid,
    };
  }
}
