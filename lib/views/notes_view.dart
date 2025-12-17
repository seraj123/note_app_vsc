import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/notes_view_body.dart';
import '../widgets/add_notes_bottom_sheet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff000000),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
            ),
            context: context,
            builder: (context) {
              return AddNotesBottomSheet();
            },
          );
        },
        child: Icon(Icons.add, color: Color(0xffaaff00)),
      ),
      body: NotesViewBody(),
    );
  }
}
