import 'package:flutter/material.dart';

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
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: (){
              if(formKey.currentState!.validate()) {
                formKey.currentState!.save();
              }else{
                autoValidateMode = AutovalidateMode.always;
                setState(() {});


              }
            },
            style: const ButtonStyle(
              fixedSize: WidgetStatePropertyAll(Size(150, 50)),
              backgroundColor: WidgetStatePropertyAll(Color(0xffaaff00)),
            ),
            child: const Text(
              "Add",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}