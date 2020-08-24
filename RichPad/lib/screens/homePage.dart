import 'package:RichPad/provider/noteProvider.dart';
import 'package:RichPad/provider/taskProvider.dart';
import 'package:RichPad/provider/userProvider.dart';
import 'package:RichPad/screens/taskHome.dart';
import 'package:RichPad/utils/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'notesPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final p = Provider.of<UserProvider>(context, listen: false);
    String user = p.user.username;

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            ('Hello $user'),
            style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'QuickSand',
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey),
            textAlign: TextAlign.center,
          ),
          actions: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundImage: AssetImage('images/avatar.jpeg'),),
          ),],
          centerTitle: true,
        ),
        floatingActionButton: Settings(),
        backgroundColor: Colors.white,
        body: MainContent());
        
  }
}

class MainContent extends StatefulWidget {
  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    String getGreetingMessage() {
      final hour = DateTime.now().hour;
      String greeting;

      if (hour < 12) {
        greeting = 'Good Morning';
      } else if (hour < 18) {
        greeting = 'Good Afternoon';
      } else {
        greeting = 'Good Evening';
      }
      return greeting;
    }

    //final DateTime now = DateTime.now();
    //final DateFormat formatter = DateFormat('dd-MM-yyyy hh:mm a');
    //final String formatted = formatter.format(now);

    final numTodos = Provider.of<TaskProvider>(context, listen: false);
    final provider = Provider.of<NotesProvider>(context, listen: false);

    String num1 = numTodos.allTasks.length.toString();
    var num2 = provider.allNotes.length.toString();

    return ListView(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    getGreetingMessage(),
                    style:
                        TextStyle(fontSize: 25.0, fontFamily: 'DancingScript'),
                    textAlign: TextAlign.left,
                  ),
                ]),
              ),
              SizedBox(
                height: 10.0,
              ),

              /* Text(formatted,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.left),
             */

              SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    topLeft: Radius.circular(0),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: TableCalendar(
                      calendarStyle: CalendarStyle(
                        todayColor: Colors.lightBlue,
                        selectedColor: Colors.blueGrey,
                        todayStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18.0),
                      ),
                      headerStyle: HeaderStyle(
                        centerHeaderTitle: true,
                        formatButtonDecoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        formatButtonTextStyle: TextStyle(color: Colors.white),
                        formatButtonShowsNext: false,
                      ),
                      initialCalendarFormat: CalendarFormat.week,
                      calendarController: _controller),
                ),
              ),
             SizedBox(height: 20.0),
              Container(
                height: 70,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  child:  Container(
                    height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),
              ),
              Container(
                height: 190.0,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => TaskHome()));
                      },
                      child: Container(
                        width: 170,
                        height: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.white,
                          elevation: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tasks',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'QuickSand'),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    CupertinoIcons.time,
                                    size: 30,
                                    color: Colors.blueGrey,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                "$num1 tasks",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.blueGrey,
                                    fontFamily: 'GrenzeGotisch'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => NotesPage()));
                      },
                      child: Container(
                        width: 170,
                        height: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.white,
                          elevation: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Notes',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'QuickSand'),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    CupertinoIcons.book,
                                    size: 30,
                                    color: Colors.blueGrey,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                "$num2 note(s)",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.blueGrey,
                                    fontFamily: 'GrenzeGotisch'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
