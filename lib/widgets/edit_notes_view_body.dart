import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart';
import 'package:flutter_app/widgets/custom_text_field.dart';

class EditNotesViewBody extends StatelessWidget {
  const EditNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        CustomAppBar(text: 'Edit Note', icon: Icons.check,),
        SizedBox(height: 50,),
        CustomTextField(hint: "Edit"),
        SizedBox(height: 50,),
        CustomTextField(maxLines: 6, hint: 'Content',),
      ],
    );
  }
}
