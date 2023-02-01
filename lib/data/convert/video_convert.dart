import 'dart:convert';

import 'package:bilibili_flutter/data/model/bilibili/video_dash_info.dart';
import 'package:bilibili_flutter/data/service/muedsa_worker_api_url.dart';
import 'package:lzstring/lzstring.dart';
import 'package:sprintf/sprintf.dart';

class VideoConvert {
  static String getDashMediaUrl(VideoDashInfo dash, int? qn, String? codec) {
    return sprintf(MuedsaWorkerUrl.buildBilibiliVideoMbp, [
      LZString.compressToEncodedURIComponentSync(
          json.encode(dash.filterVideoAudio(qn, codec).toJson()))
    ]);
  }
}
