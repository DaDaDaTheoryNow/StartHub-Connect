import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starthub_connect/services/storage_service.dart';

import 'state.dart';

class HomeController extends GetxController {
  final state = HomeState();

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().disconnect();
    Get.offNamedUntil("sign", (route) => false);
  }

  @override
  Future<void> onInit() async {
    _getUserAvatar();
    super.onInit();
  }

  _getUserAvatar() async {
    final StorageService storageService = Get.find();

    state.userAvatarUrl.value = await storageService
            .getUserPhotoUrl(FirebaseAuth.instance.currentUser!.uid) ??
        "";
  }
}
