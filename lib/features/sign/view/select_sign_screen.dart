import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/core/widgets/authentication_button.dart';
import 'package:starthub_connect/features/sign/controller/controller.dart';

class SelectSignSceen extends GetView<SignController> {
  const SelectSignSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Sign to your account',
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              )
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: 20.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AuthenticationButton(
                  label: 'Login With Google',
                  onPressed: () {
                    controller.signInWithGoogle();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
