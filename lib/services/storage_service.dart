import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class StorageService extends GetxService {
  late FirebaseStorage _storage;

  @override
  void onInit() {
    super.onInit();
    _storage = FirebaseStorage.instance;
  }

  Future<String?> uploadAvatarFromUrl(User currentUser) async {
    try {
      final Reference storageRef =
          _storage.ref().child('avatars/${currentUser.uid}.jpg');

      final http.Response response =
          await http.get(Uri.parse(currentUser.photoURL!));
      final Uint8List imageData = response.bodyBytes;

      final Directory tempDir = await getTemporaryDirectory();
      final String tempPath = '${tempDir.path}/${currentUser.uid}.jpg';
      final File tempFile = File(tempPath);

      await tempFile.writeAsBytes(imageData);

      final UploadTask uploadTask = storageRef.putFile(tempFile);

      await uploadTask;

      final String downloadUrl = await storageRef.getDownloadURL();

      await tempFile.delete();

      return downloadUrl;
    } catch (e) {
      Get.snackbar("Error", 'Error uploading avatar: $e');
      return null;
    }
  }

  Future<String?> getUserPhotoUrl(String userUid) async {
    try {
      final Reference storageRef = _storage.ref().child('avatars/$userUid.jpg');

      final String downloadUrl = await storageRef.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      return null;
    }
  }
}
