import 'package:bilibili_flutter/data/model/bilibili/bilibili_list.dart';
import 'package:bilibili_flutter/data/model/bilibili/bilibili_response.dart';
import 'package:bilibili_flutter/data/model/bilibili/danmaku/danmaku.pbserver.dart';
import 'package:bilibili_flutter/data/model/bilibili/recommend_video.dart';
import 'package:bilibili_flutter/data/model/bilibili/video_play_url_info.dart';
import 'package:bilibili_flutter/data/model/message.dart';
import 'package:bilibili_flutter/data/model/video_play_url_and_danmaku_info.dart';
import 'package:bilibili_flutter/data/service/provider/bilibili_provider.dart';

class BilibiliRepository {
  final BilibiliProvider provider;

  BilibiliRepository(this.provider);

  Future<List<RecommendVideo>> fetchRecommendedVideos(
      int pageNum, int pageSize) async {
    final Map<String, dynamic> jsonResponse =
        await provider.fetchRecommendedVideos(pageNum, pageSize);
    BilibiliResponse<BilibiliList<RecommendVideo>> response =
        BilibiliResponse.fromJson(
            jsonResponse,
            (listJson) => BilibiliList.fromJson(
                listJson, (rvJson) => RecommendVideo.fromJson(rvJson)));
    return response.code == 0 ? response.data?.list ?? [] : [];
  }

  Future<BilibiliResponse<VideoPlayUrlInfo>> fetchVideoPlayUrlInfo(
      String bv, int cid) async {
    final Map<String, dynamic> jsonResponse =
        await provider.fetchVideoPlayUrlInfo(bv, cid);
    return BilibiliResponse.fromJson(
        jsonResponse, (json) => VideoPlayUrlInfo.fromJson(json));
  }

  // Future<DmWebViewReply> fetchVideoDanmakuView(int oid) async {
  //   final List<int> buffer = await provider.fetchVideoDanmakuView(oid);
  //   return DmWebViewReply.fromBuffer(buffer);
  // }

  Future<DmSegMobileReply> fetchVideoDanmakuSegment(
      int oid, int segmentIndex) async {
    final List<int> buffer =
        await provider.fetchVideoDanmakuSegment(oid, segmentIndex);
    return DmSegMobileReply.fromBuffer(buffer);
  }

  Future<List<DanmakuElem>> fetchVideoDanmakuElem(
      int oid, int segmentSize) async {
    List<Future<DmSegMobileReply>> taskList = [];
    for (int i = 1; i <= segmentSize; i++) {
      taskList.add(fetchVideoDanmakuSegment(oid, i));
    }
    List<DmSegMobileReply> resultList = await Future.wait(taskList);
    List<DanmakuElem> list = resultList
        .map((e) => e.elems)
        .fold(<DanmakuElem>[], (value, element) => value..addAll(element))
      ..sort((a, b) => a.progress - b.progress);
    return list;
  }

  Future<ActionMessage<VideoPlayUrlAndDanmakuInfo>>
      getVideoPlayUrlAndDanmakuInfo(String bv, int cid, int segmentSize,
          {int? qn, String? codec}) async {
    List<dynamic> list = await Future.wait([
      fetchVideoPlayUrlInfo(bv, cid),
      fetchVideoDanmakuElem(cid, segmentSize)
    ]);
    BilibiliResponse<VideoPlayUrlInfo> response = list[0];
    return response.success
        ? response.data?.dash == null
            ? ActionMessage.f<VideoPlayUrlAndDanmakuInfo>('unknown error')
            : ActionMessage.s<VideoPlayUrlAndDanmakuInfo>(
                VideoPlayUrlAndDanmakuInfo(
                    playUrlInfo: response.data!, danmakuList: list[1]))
        : ActionMessage.f<VideoPlayUrlAndDanmakuInfo>(response.message);
  }
}
