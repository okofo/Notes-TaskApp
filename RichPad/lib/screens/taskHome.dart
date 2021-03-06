import 'package:RichPad/screens/tabs/allTasks.dart';
import 'package:RichPad/screens/tabs/completedTasks.dart';
import 'package:RichPad/screens/tabs/incompleteTask.dart';
import 'package:RichPad/screens/welcomePage.dart';
import 'package:RichPad/utils/addButton.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';

class TaskHome extends StatefulWidget {
  @override
  _TaskHomeState createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.navigate_before, color: Colors.black, size: 32),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            );
          },
        ),
        title: Text(
          'Tasks',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomePage(),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          indicatorColor: Colors.blue[300],
          labelColor: Colors.blue,
          controller: controller,
          unselectedLabelColor: Colors.blueGrey,
          tabs: <Widget>[
            Tab(
                child: Text(
              'AllTasks',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
            Tab(
                child: Text(
              'InComplete',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            )),
            Tab(
                child: Text(
              'Complete',
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          AllTasksTab(),
          IncompleteTasksTab(),
          CompletedTasksTab(),
        ],
      ),
      floatingActionButton: AddButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomePage(),
            ),
          );
        },
      ),
      
    );
  }
}
