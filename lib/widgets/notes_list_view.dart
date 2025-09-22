import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/widgets/note_item.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import '../cubits/search_note/search_note_cubit.dart';


class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, notesState) {
        var allNotes = context.read<NotesCubit>().notes;
        if (notesState is NotesSuccess) {
          return BlocBuilder<SearchNoteCubit, SearchNoteState>(
            builder: (context, searchState) {
              final notesToShow = searchState is SearchNoteSuccess
                  ? searchState.notes
                  : allNotes;

              return Padding(
                padding: const EdgeInsetsGeometry.symmetric(vertical: 16),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: notesToShow.length,
                  itemBuilder: (context, index) =>
                      NoteItem(note: notesToShow[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 10),
                ),
              );
            },
          );
        }
        return SizedBox();
      },
    );
  }
}
