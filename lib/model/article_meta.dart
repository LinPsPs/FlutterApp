import 'package:flutter/cupertino.dart';

class ArticleMeta {
  ArticleMeta({
    @required this.userID,
    @required this.userName,
    @required this.date,
    @required this.read,
    @required this.reply,
  });

  final String userID;
  final String userName;
  final String date;
  final int read;
  final int reply;

  String getUpdate() => '$userID 更新于 $date';

  String getReadReply() => '阅读 ($read) 回复 ($reply)';
}