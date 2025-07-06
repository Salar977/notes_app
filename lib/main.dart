import 'package:flutter/material.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:notes_app/pages/notes_page.dart';
import 'package:notes_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {

  // Initialize the note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();


  runApp(
    MultiProvider(
      providers: [
        // Note Provider
        ChangeNotifierProvider(create: (context) => NoteDatabase()),

        // Theme Provider
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const NotesPage(),
      );
  }
}
