import 'package:video_player/video_player.dart';

import 'bilibili/danmaku/danmaku.pb.dart';

class VideoPlayInfo {
  final String title;
  final String subtitle;
  final String mediaUrl;
  final VideoFormat? mediaFormat;
  final Map<String, String> mediaHttpHeaders;
  final List<DanmakuElem> danmakuList;

  const VideoPlayInfo(
      {required this.title,
      required this.subtitle,
      required this.mediaUrl,
      required this.mediaHttpHeaders,
      required this.mediaFormat,
      this.danmakuList = const <DanmakuElem>[]});
}
