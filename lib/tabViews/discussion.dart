import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forum/model/article_meta.dart';
import 'package:forum/widgets/article_card.dart';
import 'package:forum/widgets/rainbow_text.dart';

class Discussion extends StatefulWidget {
  @override
  _DiscussionState createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
  final List<Widget> entries = [];

  @override
  void initState() {
    super.initState();
    _loadFromAsset();
  }

  Future<void> _loadFromAsset() async {
    try {
      final result = await rootBundle.loadString('data/fontpage.json');
      final doc = jsonDecode(result);
      setState(() {
        for(var d in doc) {
          entries.add(
              ArticleCard(
                d['header'],
                d['content'],
                ArticleMeta(
                  d['author'],
                  d['author'],
                  d['date'],
                  int.parse(d['read']),
                  int.parse(d['reply']),
                ),
              )
          );
        }
      });
      } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (cons, ctx) {
      return Container(
          child: Row(
            children: [
              Container(
                width: ctx.maxWidth * 0.2,
                child: RainbowText('Add'),
              ),
              Container(
                width: ctx.maxWidth * 0.6,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(width: 20, child: entries[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
                ),
              ),
              Container(
                width: ctx.maxWidth * 0.2,
                child: RainbowText('Add'),
              ),
            ],
          )
      );
    }
    );
  }
}