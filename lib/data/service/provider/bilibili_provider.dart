import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:bilibili_flutter/data/service/api_client.dart';
import 'package:bilibili_flutter/data/service/muedsa_worker_api_url.dart';
import 'package:bilibili_flutter/data/service/bilibili_api_url.dart';
import 'package:sprintf/sprintf.dart';

class BilibiliProvider {

  final HttpApiClient _httpApiClient;

  BilibiliProvider(this._httpApiClient);

  Future<Map<String, dynamic>> fetchRecommendedVideos() async {
    try {
      Response response = await _httpApiClient.dio.get(MuedsaWorkerUrl.bilibiliRecommendedVideos);
      if(response.statusCode == 200){
        if(response.data != null){
          return response.data;
        }
      }else{
        debugPrint("recommendedVideos http status error, ${response.statusCode} ${response.statusMessage}");
      }
      return {};
    } on DioError catch (e) {
      debugPrint("recommendedVideos error, ${e.error}");
      return {};
    }
  }

  Future<Map<String, dynamic>> fetchVideoPlayUrlInfo(String bv, int cid) async {
    try {
      String url = sprintf(BilibiliURL.videoPlayUrl, [bv, cid]);
      Response response = await _httpApiClient.dio.get(url);
      if(response.statusCode == 200){
        if(response.data != null){
          return response.data;
        }
      }else{
        debugPrint("fetchVideoPlayUrlInfo http status error, ${response.statusCode} ${response.statusMessage}");
      }
      return {};
    } on DioError catch (e) {
      debugPrint("fetchVideoPlayUrlInfo error, ${e.error}");
      return {};
    }
  }
}