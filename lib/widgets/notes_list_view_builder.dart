import 'package:flutter/material.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListViewBuilder extends StatelessWidget {
  const NotesListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 16),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 8,
        itemBuilder: (context, index) => const NoteItem(),
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 10),
      ),
    );
  }
}
