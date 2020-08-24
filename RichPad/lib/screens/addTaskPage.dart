import 'package:RichPad/models/task.dart';
import 'package:RichPad/provider/taskProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTask extends StatefulWidget {
  AddTask({Key key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final controller = TextEditingController();
  final controller2 = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    void onAdd() {
      final String textVal = controller.text;
      final String textVal2 = controller2.text;

      final Task todo = Task(title: textVal, body: textVal2);
      if (_formKey.currentState.validate()) {
        _formKey.currentState.validate();
        Provider.of<TaskProvider>(context, listen: false).addTodo(todo);
        Navigator.pop(context);
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            child: Center(
              child: ListView(
                padding: EdgeInsets.all(40),
                shrinkWrap: true,
                children: [
                  Text(
                    "Add a new task",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Task Title",
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    autovalidate: _autoValidate,
                    controller: controller2,
                    validator: validateInput,
                    decoration: InputDecoration(
                      hintText: "Enter task body",
                    ),
                  ),
                  SizedBox(height: 30),
                  RaisedButton(
                    elevation: 0,
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(20),
                    child: Text("Add"),
                    onPressed: onAdd,
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String validateInput(String value) {
    if (value.length < 1)
      return 'can not be empty';
    else
      return null;
  }
}
