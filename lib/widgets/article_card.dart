import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forum/model/article_meta.dart';

class ArticleCard extends StatelessWidget {
  ArticleCard(this.title, this.description, this.articleMeta);

  final String title;
  final ArticleMeta articleMeta;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: null,
              child: Text(
                this.title,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              child: Text(this.description),
              padding: EdgeInsets.all(9),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
              padding: EdgeInsets.all(9),
            ),
          ],
        ),
      )
    );
  }
}
