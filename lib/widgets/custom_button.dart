import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.isLoading, required this.onPressed});
  final bool isLoading;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: onPressed,
        
      style: const ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(150, 50)),
        backgroundColor: WidgetStatePropertyAll(
            Color(0xffaaff00)),
      ),
      child: isLoading
          ? const Center(
        child:  CircularProgressIndicator(
          color: Colors.black38,
        ),
      )
          : const Text(
        "Add",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
