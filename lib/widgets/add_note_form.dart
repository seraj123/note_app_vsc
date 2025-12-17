import 'package:flutter/material.dart';
import 'package:flutter_app/model/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => AddNoteFormState();
}

class AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, content;
  bool isLoadings = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextField(onSaved: (value) => title = value, hint: "Title"),
          const SizedBox(height: 24),
          CustomTextField(
            onSaved: (value) => content = value,
            hint: "content",
            maxLines: 6,
          ),
          ColorsListView(),

          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formatedDate = DateFormat(
                      "yyyy-mm-dd ",
                    ).format(currentDate);
                    var noteModel = NoteModel(
                      title: title!,
                      subtitle: content!,
                      data: formatedDate.toString(),
                      color: const Color(0xffaaff00).toARGB32(),
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(backgroundColor: Colors.white, radius: 32),
    );
  }
}

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 32 * 2.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
          itemBuilder: (context, index) => ColorItem()),
    );
  }
}
