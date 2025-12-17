import 'package:flutter/material.dart';
import 'package:flutter_app/constance.dart';
import 'package:flutter_app/cubits/notes_cubits/notes_cubit.dart';
import 'package:flutter_app/model/note_model.dart';
import 'package:flutter_app/simpel_bloc_obsrver.dart';
import 'package:flutter_app/views/notes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins', brightness: Brightness.dark),
        home: const NotesView(),
      ),
    );
  }
}
