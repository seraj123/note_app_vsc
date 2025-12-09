import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../constance.dart';
import '../../model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  void fetchNotes() async{
    emit(NotesLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);

      final List<NoteModel> notes = noteBox.values.toList();
      emit(NotesSuccess(notes));

    } on Exception catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}


