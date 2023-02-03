import 'dart:convert';

import 'package:bilibili_flutter/data/model/bilibili/video_dash_info.dart';
import 'package:bilibili_flutter/data/service/muedsa_worker_api_url.dart';
import 'package:flutter/foundation.dart';
import 'package:lzstring/lzstring.dart';
import 'package:sprintf/sprintf.dart';

class VideoConvert {
  static String getDashMediaUrl(VideoDashInfo dash) {
    String jsonStr = json.encode(dash.toJson());
    debugPrint('dash: $jsonStr');
    return sprintf(MuedsaWorkerUrl.buildBilibiliVideoMbp,
        [LZString.compressToEncodedURIComponentSync(jsonStr)]);
  }
}
