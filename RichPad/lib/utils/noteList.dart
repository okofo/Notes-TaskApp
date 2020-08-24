import 'package:RichPad/models/note.dart';
import 'package:RichPad/screens/noteListItem.dart';
import 'package:flutter/material.dart';

class NotesList extends StatelessWidget {
  final List<Note> notes;

  NotesList({@required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenNotes(),
    );
  }

  List<Widget> getChildrenNotes() {
    return notes.map((notee) => NotesListItem(note: notee)).toList();
  }
}
