import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: const [
          SizedBox(height: 55),
          CustomAppBar(text: 'Edit Note', icon: Icons.done_outlined),
          SizedBox(height: 40),
          CustomTextField(hintText: 'title'),
          SizedBox(height: 16),
          CustomTextField(hintText: 'content', maxLines: 5),
        ],
      ),
    );
  }
}
