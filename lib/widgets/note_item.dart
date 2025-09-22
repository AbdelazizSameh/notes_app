import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

import '../cubits/notes_cubit/notes_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(note: note);
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 24, left: 24),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(right: 0),
              title: Text(
                note.title,
                style: const TextStyle(color: Colors.black, fontSize: 27),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 5),
                child: Text(
                  note.subtitle,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 122, 122, 122),
                    fontSize: 20,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 30.0,
                    left: 16,
                    right: 10,
                  ),
                  child: Icon(Icons.delete, color: Colors.black, size: 30),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                note.date,
                style: TextStyle(
                  color: const Color.fromARGB(255, 122, 122, 122),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
