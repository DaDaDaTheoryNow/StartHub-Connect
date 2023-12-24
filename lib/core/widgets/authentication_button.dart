import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({
    required this.label,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 12.h),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.indigo),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        )),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          SizedBox(
            width: 10.w,
          ),
          const FaIcon(
            FontAwesomeIcons.google,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
