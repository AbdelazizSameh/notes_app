import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/widgets/note_item.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import '../models/note_model.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes;
        return Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 16),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: notes.length,
            itemBuilder: (context, index) => NoteItem(note: notes[index]),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 10),
          ),
        );
      },
    );
  }
}
