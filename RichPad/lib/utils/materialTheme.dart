import 'package:RichPad/screens/splashScreen.dart';
import 'package:RichPad/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      home: SplashScreen(),
      theme: theme.getTheme(),
      debugShowCheckedModeBanner: false,
      title: '',
    );
  }
}
