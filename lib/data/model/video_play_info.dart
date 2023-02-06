import 'bilibili/danmaku/danmaku.pb.dart';

class VideoPlayInfo {
  final String title;
  final String subtitle;
  final String mediaUrl;
  final Map<String, String> mediaHttpHeaders;
  final List<DanmakuElem> danmakuList;

  const VideoPlayInfo(
      {required this.title,
      required this.subtitle,
      required this.mediaUrl,
      required this.mediaHttpHeaders,
      this.danmakuList = const <DanmakuElem>[]});
}
