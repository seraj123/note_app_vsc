import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(

      color: Color(0xffaaff00),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 40,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                "Flutter Tips ",
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  "Build Your Career With Siraj Abdulhafiz",
                  style: TextStyle(color: Colors.black.withValues(alpha: 0.5), fontSize: 18),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.trash, size: 24, color: Colors.black,)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text("Sep 5,2025", style: TextStyle(color: Colors.black.withValues(alpha: 0.5))),
            ),
          ],
        ),
      ),
    );
  }
}
