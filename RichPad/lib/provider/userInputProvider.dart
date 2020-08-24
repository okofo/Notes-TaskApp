import 'package:RichPad/models/userInput.dart';
import 'baseProvider.dart';

class UserInputProvider extends BaseProvider {
  String _username;
  UserInput _tasktitle;
  UserInput _taskbody;

  String get username => _username;
  UserInput get user => _tasktitle;
  UserInput get userp => _taskbody;

  void setName(String n) {
    _username = n;
    notifyListeners();
  }

  void setTaskTitle(UserInput u) {
    _tasktitle = u;
    notifyListeners();
  }

  void setTaskBody(UserInput x) {
    _taskbody = x;
    notifyListeners();
  }
}
