import 'bilibili/danmaku/danmaku.pb.dart';
import 'bilibili/video_play_url_info.dart';

class VideoPlayUrlAndDanmakuInfo {
  VideoPlayUrlInfo playUrlInfo;
  List<DanmakuElem> danmakuList;

  VideoPlayUrlAndDanmakuInfo(
      {required this.playUrlInfo, this.danmakuList = const <DanmakuElem>[]});
}
