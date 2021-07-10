import 'package:flutter/material.dart';
import 'package:forum/widgets/editor.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: null,
            child: Icon(
              Icons.save,
              color: Colors.orangeAccent,
              size: 30,
            ),
          )
        ],
      ),
      body: Editor(),
    );
  }
}