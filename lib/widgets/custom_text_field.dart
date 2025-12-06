import 'package:flutter/material.dart';
import 'package:flutter_app/constance.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(Color(0xffaaff00)),
        hintText: "Title", hintStyle: TextStyle(color: kPrimaryColor.withValues(alpha: 0.3))
      )
    );
  }

  OutlineInputBorder buildOutlineInputBorder([dynamic color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(
          color: color ?? Colors.white
        )
    );
  }
}
