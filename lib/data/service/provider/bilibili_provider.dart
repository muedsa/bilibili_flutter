import 'dart:io';

import 'package:bilibili_flutter/data/service/api_client.dart';
import 'package:bilibili_flutter/data/service/bilibili_api_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sprintf/sprintf.dart';

class BilibiliProvider {
  final HttpApiClient _httpApiClient;

  BilibiliProvider(this._httpApiClient);

  Future<Map<String, dynamic>> fetchRecommendedVideos(
      int pageNum, int pageSize) async {
    try {
      String url = sprintf(BilibiliURL.recommendedVideos, [pageNum, pageSize]);
      Response response = await _httpApiClient.dio.get(url);
      if (response.statusCode == HttpStatus.ok) {
        if (response.data != null) {
          return response.data;
        }
      } else {
        debugPrint(
            "recommendedVideos http status error, ${response.statusCode} ${response.statusMessage}");
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
      if (response.statusCode == HttpStatus.ok) {
        if (response.data != null) {
          return response.data;
        }
      } else {
        debugPrint(
            "fetchVideoPlayUrlInfo http status error, ${response.statusCode} ${response.statusMessage}");
      }
      return {};
    } on DioError catch (e) {
      debugPrint("fetchVideoPlayUrlInfo error, ${e.error}");
      return {};
    }
  }

  Future<List<int>> fetchVideoDanmakuView(int oid) async {
    try {
      String url = sprintf(BilibiliURL.videoDanmakuView, [oid]);
      Response response = await _httpApiClient.dio
          .get(url, options: Options(responseType: ResponseType.bytes));
      if (response.statusCode == HttpStatus.ok) {
        if (response.data != null) {
          return response.data;
        }
      } else {
        debugPrint(
            "fetchVideoDanmakuView http status error, ${response.statusCode} ${response.statusMessage}");
      }
      return [];
    } on DioError catch (e) {
      debugPrint("fetchVideoDanmakuView error, ${e.error}");
      return [];
    }
  }

  Future<List<int>> fetchVideoDanmakuSegment(int oid, int segmentIndex) async {
    try {
      String url =
          sprintf(BilibiliURL.videoDanmakuSegment, [oid, segmentIndex]);
      Response response = await _httpApiClient.dio
          .get(url, options: Options(responseType: ResponseType.bytes));
      if (response.statusCode == HttpStatus.ok) {
        if (response.data != null) {
          return response.data;
        }
      } else {
        debugPrint(
            "fetchVideoDanmakuSegment http status error, ${response.statusCode} ${response.statusMessage}");
      }
      return [];
    } on DioError catch (e) {
      debugPrint("fetchVideoDanmakuSegment error, ${e.error}");
      return [];
    }
  }
}
