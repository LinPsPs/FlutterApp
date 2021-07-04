import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/model/article_meta.dart';

class ArticleCard extends StatelessWidget{
  ArticleCard({this.title, this.description, this.articleMeta});

  final String title;
  final ArticleMeta articleMeta;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: null,
              child: Text(
                this.title,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
          ),
          Text(this.description),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  this.articleMeta.getReadReply(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              Text(
                this.articleMeta.getUpdate(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}