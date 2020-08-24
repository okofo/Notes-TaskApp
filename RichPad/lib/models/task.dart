
class Task {
  String title;
 String body;

  bool completed;

  Task({this.title, this.body ,this.completed = false});

  void toggleCompleted() {
    completed = !completed;
  }

  
}

