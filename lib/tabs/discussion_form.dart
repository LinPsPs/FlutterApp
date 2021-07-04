import 'package:flutter/cupertino.dart';
import 'package:test_app/widgets/article.dart';

class DiscussionForm extends StatefulWidget {
  @override
  _DiscussionState createState() => _DiscussionState();
}

class _DiscussionState extends State<DiscussionForm> {

  List articles = [

  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: context.size.width * 0.2,
        ),
        Container(
          width: context.size.width * 0.6,
        ),
        Container(
          width: context.size.width * 0.2,
        )
      ],
    );
  }
}