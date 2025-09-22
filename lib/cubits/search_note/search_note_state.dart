part of 'search_note_cubit.dart';

@immutable
abstract class SearchNoteState {}

class SearchNoteInitial extends SearchNoteState {}

class SearchNoteSuccess extends SearchNoteState {
  final List<NoteModel> notes;
  SearchNoteSuccess(this.notes);
}
