import 'package:flutter/material.dart';
import 'package:notes_app/views/notes_view.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white.withValues(alpha: 0.2),
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
        // textTheme: ,
      ),
      home: const NotesView(),
    );
  }
}
