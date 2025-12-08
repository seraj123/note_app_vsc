import 'package:flutter/material.dart';
import 'package:flutter_app/constance.dart';
import 'package:flutter_app/views/notes_view.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
await  Hive.initFlutter();
await Hive.openBox(kNoteBox);
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          brightness: Brightness.dark
        ),
        home: const NotesView());
  }
}
