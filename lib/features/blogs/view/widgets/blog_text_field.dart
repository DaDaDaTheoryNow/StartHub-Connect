import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starthub_connect/config/theme/app_colors.dart';

class BlogTextField extends StatelessWidget {
  const BlogTextField({
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.keyboardType,
    this.isSend = false,
    this.textEditingController,
    this.onSendPressed,
    this.validator,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool isSend;
  final VoidCallback? onSendPressed;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
      child: TextFormField(
        controller: textEditingController,
        cursorColor: kBlueColor,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(18.0),
          filled: true,
          fillColor: kOpacityBlueColor,
          prefixIcon: Icon(
            icon,
            size: 24.0,
            color: Colors.black,
          ),
          suffixIcon: isSend
              ? Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Colors.black,
                      size: 24.0,
                    ),
                    onPressed: onSendPressed,
                  ),
                )
              : null,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 15.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: kOpacityBlueColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: kBlueColor),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
