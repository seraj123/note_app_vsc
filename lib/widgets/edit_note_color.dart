import 'package:flutter/material.dart';

import '../constance.dart';
import '../model/note_model.dart';
import 'color_list_view.dart';

class EditNotesViewColorsList extends StatefulWidget {
  const EditNotesViewColorsList({super.key, required this.note});
  final NoteModel note;


  @override
  State<EditNotesViewColorsList> createState() => _EditNotesViewColorsListState();
}
class _EditNotesViewColorsListState extends State<EditNotesViewColorsList> {
  late  int selectedColor;
  @override
  void initState() {
    selectedColor = colors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2.5,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) =>  GestureDetector(
              onTap: () {
                widget.note.color = colors[index].toARGB32();
                selectedColor = index;
                setState(() {
                });
              },
              child: ColorItem(isActive: selectedColor == index, color: colors[index],))),
    );
  }
}
