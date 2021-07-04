import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/home.dart';
import 'package:test_app/widgets/article_card.dart';
import 'package:test_app/widgets/rainbow_text.dart';
import 'package:test_app/widgets/section_bar.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(Forum());
}

class Forum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forum',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: HomePage(),
        ),
        body: SectionBar(),
      ),
      theme: ThemeData(
        primaryColor: Colors.red,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        // toggleButtonsTheme: ToggleButtonsThemeData(
        // )
      ),
    );
  }
}