import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/search_note/search_note_cubit.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

import '../cubits/notes_cubit/notes_cubit.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 55),
          GestureDetector(
            onTap: () {
              if (isTapped == true) {
                var allNotes = context.read<NotesCubit>().notes;
                context.read<SearchNoteCubit>().searchQuery('', allNotes);
              }
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: CustomAppBar(
              text: 'Notes',
              searchHintText: 'search a note',
              icon: isTapped ? Icons.close : Icons.search,
              tapped: isTapped,
              onChanged: (query) {
                var allNotes = context.read<NotesCubit>().notes;
                context.read<SearchNoteCubit>().searchQuery(query, allNotes);
              },
            ),
          ),
          const Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
