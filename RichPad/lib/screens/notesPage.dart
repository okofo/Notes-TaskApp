import 'package:RichPad/provider/noteProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homePage.dart';
import 'noteListItem.dart';
import 'notesHome.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 30.0, left: 10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 2.0),
                      child: Text(
                        'Notes',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        ' ${provider.allNotes.length} Note(s)',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 220,
                ),
                Card(
                  color: Colors.grey[50],
                  shape: CircleBorder(),
                  child: IconButton(
                    alignment: Alignment.center,
                    icon: Icon(CupertinoIcons.pen,
                        color: Colors.black45, size: 23.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NoteEditor()),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            if (provider.allNotes.isEmpty)
              Center(
                child: Text("No notes yet."),
              ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: provider.allNotes.length,
              itemBuilder: (context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoteEditor(
                          exisitingNote: provider.allNotes[index],
                        ),
                      ),
                    );
                  },
                  child: NotesListItem(
                    note: provider.allNotes[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Card(
        color: Colors.grey[300],
        shape: CircleBorder(),
        child: IconButton(
          alignment: Alignment.center,
          icon: Icon(CupertinoIcons.home, color: Colors.black, size: 23.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
