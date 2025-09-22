import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';

part 'search_note_state.dart';

class SearchNoteCubit extends Cubit<SearchNoteState> {
  SearchNoteCubit() : super(SearchNoteInitial());

  List<NoteModel> filteredNotes = [];

  void setNotes(List<NoteModel> notes) {
    filteredNotes = notes;
    emit(SearchNoteSuccess(notes));
  }

  void searchQuery(String query, List<NoteModel> allNotes) {
    if (query.isEmpty) {
      filteredNotes = allNotes;
      emit(SearchNoteSuccess(allNotes));
    } else {
      final filteredNotes = allNotes
          .where(
            (note) =>
                note.title.toLowerCase().contains(query) ||
                note.subtitle.toLowerCase().contains(query),
          )
          .toList();
      emit(SearchNoteSuccess(filteredNotes));
    }
  }
}
