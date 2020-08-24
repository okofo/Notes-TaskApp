import 'package:RichPad/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  Settings({this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    createAlertDialog(BuildContext context) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.blue,
              content: Container(
                height: 100,
                child: Column(
                  children: <Widget>[
                    FlatButton(
                        child: Text('Dark Theme'),
                        onPressed: () =>
                            _themeChanger.setTheme(ThemeData.dark())),
                    FlatButton(
                        child: Text('Light Theme',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () =>
                            _themeChanger.setTheme(ThemeData.light())),
                  ],
                ),
              ),
            );
          });
    }

    return IconButton(
      icon: Icon(
        CupertinoIcons.settings,
        color: Colors.black,
        size: 40,
      ),
      onPressed: () {
        createAlertDialog(context);
      },
    );
  }
}
