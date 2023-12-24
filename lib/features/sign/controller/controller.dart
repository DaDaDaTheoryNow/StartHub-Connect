import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart' hide FormData, Response;
import 'package:starthub_connect/core/util/app_dialog.dart';
import 'package:starthub_connect/features/sign/controller/state.dart';
import 'package:starthub_connect/services/sign_service.dart';
import 'package:starthub_connect/services/storage_service.dart';

class SignController extends GetxController {
  final state = SignState();

  final appDialog = AppDialog();

  Future<void> signInWithGoogle() async {
    final StorageService storageService = Get.find();
    final SignService signService = Get.find();

    appDialog.loading();

    final userCredential = await signService.signInWithGoogle();

    if (userCredential != null && userCredential.user != null) {
      final photoUrl =
          await storageService.uploadAvatarFromUrl(userCredential.user!);

      DatabaseReference userRef = FirebaseDatabase.instance
          .ref()
          .child('users/${userCredential.user!.uid}');
      await userRef.update({
        'email': userCredential.user!.email,
        'name': userCredential.user!.displayName,
        'photoUrl': photoUrl,
      });

      Get.offNamedUntil("/home", (route) => false);
    }

    appDialog.close();
  }
}
