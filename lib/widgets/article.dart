import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Article extends StatelessWidget {
  Article(this.title, this.content);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: this.content,
      selectable: true,
    );
  }
}