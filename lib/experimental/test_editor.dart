// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:forum/pages/post_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'TEST',
      initialRoute: '/',
      routes: {
        '/' : (context) => MyApp(),
        '/editor' : (context) => PostPage(),
      },
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Test ti',
        ),
        actions: [],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/editor');
          },
          child: Text('Launch Editor'),
        ),
      ),
      // body: RawKeyboardListener(
      //   focusNode: FocusNode(),
      //   child: Editor(),
      // ),
    );
  }
}