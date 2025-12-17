import 'package:flutter/material.dart';
import 'package:flutter_app/cubits/notes_cubits/notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/note_model.dart';
import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return ListView.builder(
            itemCount:  notes.length,
            itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: NoteItem(note: notes[index],),
          );
        });
      },
    );
  }
}
