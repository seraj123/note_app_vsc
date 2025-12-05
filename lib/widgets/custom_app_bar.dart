import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Notes", style: TextStyle(fontSize: 28,)),
        ElevatedButton(

            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white24)
            ),
            onPressed: () {},
            child: Icon(Icons.search, size: 26,)),
      ],
    );
  }
}
