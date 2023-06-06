import 'dart:convert';

import 'package:bilibili_flutter/data/model/bilibili/video_dash_info.dart';
import 'package:bilibili_flutter/data/service/muedsa_worker_api_url.dart';
import 'package:bilibili_flutter/service/dash_mpd_server.dart';
import 'package:flutter/cupertino.dart';
import 'package:lzstring/lzstring.dart';
import 'package:sprintf/sprintf.dart';

class VideoConvert {
  static String getDashMediaUrl(String bv, int cid) {
    return '${DashMpdServer.host}${DashMpdServer.mpdPath}?bv=$bv&cid=$cid';
  }

  static String getDashMediaUrlOld(VideoDashInfo dash) {
    String jsonStr = json.encode(dash.toJson());
    debugPrint('dash: $jsonStr');
    return sprintf(MuedsaWorkerUrl.buildBilibiliVideoMbp,
        [LZString.compressToEncodedURIComponentSync(jsonStr)]);
  }
}
