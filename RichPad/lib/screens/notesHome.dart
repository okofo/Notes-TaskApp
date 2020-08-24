import 'package:RichPad/models/note.dart';
import 'package:RichPad/provider/noteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteEditor extends StatefulWidget {
  final Note exisitingNote;
  NoteEditor({this.exisitingNote});

  @override
  _NoteEditorState createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  DateTime get currentTime => DateTime.now();

  Note note = Note(/*createdAt: DateTime.now(), updatedAt: DateTime.now()*/);

  @override
  void initState() {
    if (widget.exisitingNote != null) note = widget.exisitingNote;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<NotesProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  brightness: Brightness.light,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.black),
                  leading: IconButton(
                    icon: Icon(Icons.chevron_left, size: 34),
                    onPressed: () {
                      if (widget.exisitingNote != null) {
                        p.updateNote(widget.exisitingNote, note);
                      } else {
                        p.addNote(note);
                      }
                      Navigator.pop(context);
                    },
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () {
                        p.deleteNote(note);
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Column(
                      children: [
                        TextField(
                          style: TextStyle(fontSize: 22),
                          controller: TextEditingController(text: note.title),
                          onChanged: (v) =>
                              note = note.copyWith(title: v, time: currentTime),
                          decoration: InputDecoration(
                            hintText: "Title",
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            maxLines: null,
                            controller: TextEditingController(text: note.body),
                            onChanged: (v) => note =
                                note.copyWith(body: v, time: currentTime),
                            decoration: InputDecoration(
                              hintText: "Note",
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onVerticalDragEnd: (details) {
              final scope = FocusScope.of(context);
              scope.unfocus();
            },
            child: Container(
              color: Colors.white,
              child: SafeArea(
                top: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.add_box),
                      onPressed: () {},
                    ),
                    Text(
                      "Edited ",
                      style: TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        Provider.of<NotesProvider>(context, listen: false)
                            .addNote(note);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
