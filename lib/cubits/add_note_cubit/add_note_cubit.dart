import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/note_model.dart';
import 'package:hive/hive.dart';

import '../../constance.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  void addNote(NoteModel note) async{
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);

         await noteBox.add(note);
         emit(AddNoteSuccess());

    } on Exception catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
