import 'package:RichPad/provider/noteProvider.dart';
import 'package:RichPad/provider/taskProvider.dart';
import 'package:RichPad/provider/userInputProvider.dart';
import 'package:RichPad/provider/userProvider.dart';
import 'package:RichPad/utils/materialTheme.dart';
import 'package:RichPad/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NotesProvider()),
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProvider(create: (context) => UserInputProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(ThemeData.light()),
        ),
      ],
      child: MaterialAppWithTheme(),
    );
  }
}
