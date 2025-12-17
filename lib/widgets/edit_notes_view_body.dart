import 'package:flutter/material.dart';
import 'package:flutter_app/model/note_model.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart';
import 'package:flutter_app/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/notes_cubits/notes_cubit.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {

 String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(text: 'Edit Note', icon: Icons.check, onPressed: () { 
            widget.note.title = title ?? widget.note.title;
            widget.note.subtitle = content ?? widget.note.subtitle;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchNotes();
            Navigator.pop(context);
           },),
          SizedBox(height: 50),
          CustomTextField(
            onChanged: (value){
              title = value;
            },
            hint: widget.note.title,
          ),
          SizedBox(height: 50),
          CustomTextField(
            onChanged: (value){
              content = value;
            },
            maxLines: 6, hint: widget.note.subtitle,),
        ],
      ),
    );
  }
}
