class VideoBaseInfo {
  String bv;
  int cid;
  String url;
  String title;
  String coverUrl;
  int duration;
  int publishTime;
  int authorMid;
  String author;
  String authorFaceUrl;

  VideoBaseInfo(
      {required this.bv,
      required this.cid,
      required this.url,
      required this.title,
      required this.coverUrl,
      required this.duration,
      required this.publishTime,
      required this.authorMid,
      required this.author,
      required this.authorFaceUrl});
}
