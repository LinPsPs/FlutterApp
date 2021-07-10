class ArticleMeta {

  ArticleMeta(this.userID, this.userName, this.date, this.read, this.reply);

  final String userID;
  final String userName;
  final String date;
  final int read;
  final int reply;

  String getUpdate() => '$userID 更新于 $date';

  String getReadReply() => '阅读 ($read) 回复 ($reply)';
}