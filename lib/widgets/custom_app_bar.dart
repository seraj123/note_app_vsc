import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, this.onPressed, required this.icon, });
final String text;
final IconData icon;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyle(fontSize: 28,)),
        ElevatedButton(

            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white24)
            ),
            onPressed: onPressed,
            child: Icon(icon, size: 26,)),
      ],
    );
  }
}
