import 'package:bloc/bloc.dart';

import 'add_note_state.dart';


class AddNoteCubit extends Cubit<AddNoteState>{
  AddNoteCubit() :super (AddNoteInitialState());
}