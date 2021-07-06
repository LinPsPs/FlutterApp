import 'dart:html';

import 'package:flutter/material.dart';
import 'package:test_app/model/article_meta.dart';
import 'package:test_app/widgets/article_card.dart';

class Discussion extends StatefulWidget {
  @override
  _DiscussionState createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
  final List<Widget> entries = [
    ArticleCard(
        title: 'Test',
        description: 'Test Content Description',
        articleMeta: ArticleMeta(
            date: '07/06',
            read: 0,
            reply: 0,
            userID: 't12ab',
            userName: 'TEST')),
  ];
  // @override
  // Widget build(BuildContext context) {
  //   return Text('TEST');
  // }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(child: entries[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
