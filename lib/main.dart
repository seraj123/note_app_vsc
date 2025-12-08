import 'package:flutter/material.dart';
import 'package:flutter_app/add_note_cubit/add_note_cubit.dart';
import 'package:flutter_app/constance.dart';
import 'package:flutter_app/model/note_model.dart';
import 'package:flutter_app/views/notes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNoteBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=> AddNoteCubit())
      ],
      child: MaterialApp(

          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'Poppins',
              brightness: Brightness.dark
          ),
          home: const NotesView()),
    );
  }
}
