import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  // text controller to access what the user types in
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    readNotes();
  }

  // create a note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          // create button
          MaterialButton(
            onPressed: () {
              context.read<NoteDatabase>().addNote(textController.text);

              textController.clear();

              Navigator.pop(context);
            },
            child: const Text('Create'),
          ),

          // cancel button

          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          )
        ],
      )
    );
  }

  // read notes
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // update note
  void updateNote(Note note) {
    // pre-fill the current note text
    textController.text = note.text;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          // update button
          MaterialButton(
            onPressed: () {
              context.read<NoteDatabase>().updateNote(note.id, textController.text);

              textController.clear();

              Navigator.pop(context);
            },
            child: const Text('Update'),
          ),
        ],
      )
    );
  }

  // delete note
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }


  @override
  Widget build(BuildContext context) {

    // note database
    final noteDatabase = context.watch<NoteDatabase>();

    // current notes
    List<Note> currentNotes = noteDatabase.currentNotes; 

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.add, color: Colors.black87,),
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          // Heading
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Notes',
              style: GoogleFonts.dmSerifText(
                fontSize: 50,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
              
            ),
          ),


          // List of notes
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder:(context, index) {
                // get individual note
                final note = currentNotes[index];
            
                // list tile UI
                return ListTile(
                  title: Text(note.text),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // edit button
                      IconButton(
                        onPressed: () => updateNote(note),
                        icon: Icon(Icons.edit)
                      ),
            
                      // delete button
                      IconButton(
                        onPressed: () => deleteNote(note.id),
                        icon: Icon(Icons.delete)
                      )
                      
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}