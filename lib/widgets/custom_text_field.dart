import 'package:flutter/material.dart';
import 'package:flutter_app/constance.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField( {super.key, this.onChanged,required this.hint,  this.maxLines = 1, this.onSaved});
final String hint;
final int maxLines;
final  void Function(String?)? onSaved;
final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field Required";
      }else{
          return null;
        }
      },
      style: TextStyle(color: kPrimaryColor),
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(Color(0xffaaff00)),
        hintText: hint, hintStyle: TextStyle(color: kPrimaryColor.withValues(alpha: 0.3)),
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
