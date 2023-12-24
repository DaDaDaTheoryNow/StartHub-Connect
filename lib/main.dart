import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/config/routes/routes.dart';
import 'package:starthub_connect/config/theme/theme.dart';
import 'package:starthub_connect/services/sign_service.dart';

import 'firebase_options.dart';
import 'services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final isSignIn = FirebaseAuth.instance.currentUser != null;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return GetMaterialApp(
          initialBinding: BindingsBuilder(() {
            Get.put(StorageService());
            Get.put(SignService());
          }),
          title: "Startub Connect",
          theme: AppTheme.themeData,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          initialRoute: isSignIn ? AppRoutes.home : AppRoutes.sign,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
