import 'package:RichPad/models/note.dart';
import 'package:flutter/material.dart';

class NotesProvider extends ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get allNotes => _notes;

 

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(Note oldNote, Note newNote) {
    final index = _notes.indexWhere((o) => o == oldNote);
    _notes[index] = newNote;
    // _notes.update(note);
    notifyListeners();
  }

  void deleteNote(Note note) {
    _notes.remove(note);
    notifyListeners();
  }
}
