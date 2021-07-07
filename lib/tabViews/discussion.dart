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
        description: 'SBU研究生，有奥德赛一台，提供打包行李、小规模搬家和家具安装服务。车子后面两排座椅拆除以后有一个2.5m（长）* 1.2m（宽）* 1.5m（高）的空间。可以自带打包材料和家具的安装（拆解）工具。打包和安装（拆解）家具按每小时30美金收费，搬家连人带车每小时50美金。',
        articleMeta: ArticleMeta(
            date: '07/06',
            read: 0,
            reply: 0,
            userID: 't12ab',
            userName: 'TEST')),
    ArticleCard(
        title: 'Test2',
        description: 'Test2 Content Description',
        articleMeta: ArticleMeta(
            date: '07/07',
            read: 0,
            reply: 0,
            userID: 't12ab',
            userName: 'TEST')),
    ArticleCard(
        title: 'Test3',
        description: 'Test3 Content Description',
        articleMeta: ArticleMeta(
            date: '07/08',
            read: 0,
            reply: 0,
            userID: 't12ab',
            userName: 'TEST')),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (cons, ctx) {
      return Container(
          child: Row(
            children: [
              Container(
                width: ctx.maxWidth * 0.2,
                child: Text('Add'),
              ),
              Container(
                width: ctx.maxWidth * 0.6,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        width: 20,
                        child: entries[index]
                    );
                  },
                  separatorBuilder: (BuildContext context,
                      int index) => const Divider(),
                ),
              ),
              Container(
                width: ctx.maxWidth * 0.2,
                child: Text('Add'),
              ),
            ],)
      );
    });
    // return ListView.separated(
    //   padding: const EdgeInsets.all(8),
    //   itemCount: entries.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       width: 20,
    //         child: entries[index]
    //     );
    //   },
    //   separatorBuilder: (BuildContext context, int index) => const Divider(),
    // );
  }
}
