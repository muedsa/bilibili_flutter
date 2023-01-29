import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:bilibili_flutter/data/service/api_client.dart';
import 'package:bilibili_flutter/data/service/muedsa_worker_api_url.dart';

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
}