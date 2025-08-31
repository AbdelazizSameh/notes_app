import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/notes_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
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
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.grey.shade800,
        ),
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
        // textTheme: ,
      ),
      home: const NotesView(),
    );
  }
}
