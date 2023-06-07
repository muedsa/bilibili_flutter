import 'package:bilibili_flutter/service/dash_mpd_server.dart';

class VideoConvert {
  static String getDashMediaUrl(String bv, int cid) {
    return '${DashMpdServer.host}${DashMpdServer.mpdPath}?bv=$bv&cid=$cid';
  }
}
