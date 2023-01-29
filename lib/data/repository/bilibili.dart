import 'package:bilibili_flutter/data/model/recommended_video.dart';
import 'package:bilibili_flutter/data/model/mw_list_response.dart';
import 'package:bilibili_flutter/data/service/provider/bilibili_provider.dart';

class BilibiliRepository {
  final BilibiliProvider provider;

  BilibiliRepository(this.provider);

  Future<List<RecommendedVideo>> fetchRecommendedVideos() async {
    final Map<String, dynamic> jsonResponse = await provider.fetchRecommendedVideos();
    MwListResponse<RecommendedVideo> mwResponse = MwListResponse
        .fromJson(jsonResponse, (json) => RecommendedVideo.fromJson(json));
    List<RecommendedVideo> list = [];
    if(mwResponse.code == 0){
      if(mwResponse.data != null){
        list = mwResponse.data!;
      }
    }
    return list;
  }
}