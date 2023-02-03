import 'package:bilibili_flutter/data/convert/video_convert.dart';
import 'package:bilibili_flutter/data/model/bilibili/bilibili_response.dart';
import 'package:bilibili_flutter/data/model/bilibili/danmaku/danmaku.pbserver.dart';
import 'package:bilibili_flutter/data/model/bilibili/mw_list_response.dart';
import 'package:bilibili_flutter/data/model/bilibili/recommended_video.dart';
import 'package:bilibili_flutter/data/model/bilibili/video_play_url_info.dart';
import 'package:bilibili_flutter/data/model/message.dart';
import 'package:bilibili_flutter/data/service/provider/bilibili_provider.dart';

class BilibiliRepository {
  final BilibiliProvider provider;

  BilibiliRepository(this.provider);

  Future<List<RecommendedVideo>> fetchRecommendedVideos() async {
    final Map<String, dynamic> jsonResponse =
        await provider.fetchRecommendedVideos();
    MwListResponse<RecommendedVideo> mwResponse = MwListResponse.fromJson(
        jsonResponse, (json) => RecommendedVideo.fromJson(json));
    List<RecommendedVideo> list = [];
    if (mwResponse.code == 0) {
      if (mwResponse.data != null) {
        list = mwResponse.data!;
      }
    }
    return list;
  }

  Future<BiliBiliResponse<VideoPlayUrlInfo>> fetchVideoPlayUrlInfo(
      String bv, int cid) async {
    final Map<String, dynamic> jsonResponse =
        await provider.fetchVideoPlayUrlInfo(bv, cid);
    return BiliBiliResponse.fromJson(
        jsonResponse, (json) => VideoPlayUrlInfo.fromJson(json));
  }

  Future<ActionMessage<String>> getDashVideoPlayUrl(String bv, int cid,
      {int? qn, String? codec}) async {
    BiliBiliResponse<VideoPlayUrlInfo> response =
        await fetchVideoPlayUrlInfo(bv, cid);
    return response.success
        ? response.data?.dash == null
            ? ActionMessage.f<String>('unknown error')
            : ActionMessage.s<String>(VideoConvert.getDashMediaUrl(
                response.data!.dash.filterVideoAudio(qn, codec)))
        : ActionMessage.f<String>(response.message);
  }

  Future<DmWebViewReply> fetchVideoDanmakuView(int oid) async {
    final List<int> buffer = await provider.fetchVideoDanmakuView(oid);
    return DmWebViewReply.fromBuffer(buffer);
  }
}
