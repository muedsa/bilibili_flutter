import 'dart:io';

import 'package:bilibili_flutter/data/model/bilibili/bilibili_response.dart';
import 'package:bilibili_flutter/data/model/bilibili/video_dash_info.dart';
import 'package:bilibili_flutter/data/model/bilibili/video_dash_representation.dart';
import 'package:bilibili_flutter/data/model/bilibili/video_play_url_info.dart';
import 'package:bilibili_flutter/data/repository/bilibili.dart';
import 'package:bilibili_flutter/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

class DashMpdServer {
  static late HttpServer httpServer;
  static late BilibiliRepository repository;
  static late String host;

  static String mpdPath = '/mpb';

  static init(BilibiliRepository repository) {
    DashMpdServer.repository = repository;

    Router router = Router(notFoundHandler: (Request request) {
      debugPrint('http request: ${request.url}');
      debugPrint('http request headers: ${request.headers}');
      return Response.notFound('Page not found');
    });
    router.get(mpdPath, _mpbHandler);

    NetUtils.getUnusedPort(
            (port) => io.serve(router, InternetAddress.loopbackIPv4, port))
        .then((value) {
      httpServer = value;
      host = 'http://${httpServer.address.host}:${httpServer.port}';
      debugPrint('DashMpdService working at $host');
    });
  }

  static Future<Response> _mpbHandler(Request request) async {
    String? paramBv = request.url.queryParameters['bv'];
    String? paramCid = request.url.queryParameters['cid'];
    String? paramQn = request.url.queryParameters['qn'];
    String? paramCodec = request.url.queryParameters['codec'];
    String httpResponse = "error";
    if (paramBv != null && paramCid != null) {
      debugPrint('http request headers: ${request.headers}');
      BilibiliResponse<VideoPlayUrlInfo> response =
          await repository.fetchVideoPlayUrlInfo(paramBv, int.parse(paramCid));
      if (response.code == 0 && response.data != null) {
        httpResponse = buildMpd(response.data!,
            paramQn != null ? int.tryParse(paramQn) : null, paramCodec);
      }
    }
    return Response.ok(httpResponse);
  }

  static String buildMpd(
      VideoPlayUrlInfo videoPlayUrlInfo, int? qn, String? codec) {
    VideoDashInfo dash = videoPlayUrlInfo.dash.filterVideoAudio(qn, codec);
    List<String> videoRepresentationList = [];
    int i = 0;
    for (VideoDashRepresentation video in dash.video) {
      String videoUrl = '<![CDATA[${video.baseUrl}]]>';
      i++;
      videoRepresentationList
          .add('''<Representation id="${video.id}_${video.codeCid}"
                 codecs="${video.codecs}"
                 bandwidth="${video.bandwidth}"
                 width="${video.width}"
                 height="${video.height}"
                 frameRate="${video.frameRate}"
                 sar="${video.sar}">
                 <BaseURL>$videoUrl</BaseURL>
                 <SegmentBase indexRange="${video.segmentBase.indexRange}">
                     <Initialization range="${video.segmentBase.initialization}"/>
                 </SegmentBase>
            </Representation>''');
    }
    List<String> audioRepresentationList = [];
    for (VideoDashRepresentation audio in dash.audio) {
      String audioUrl = '<![CDATA[${audio.baseUrl}]]>';
      audioRepresentationList
          .add('''<Representation id="${audio.id}_${audio.codeCid}"
                 codecs="${audio.codecs}"
                 bandwidth="${audio.bandwidth}">
                 <BaseURL>$audioUrl</BaseURL>
                 <SegmentBase indexRange="${audio.segmentBase.indexRange}">
                     <Initialization range="${audio.segmentBase.indexRange}"/>
                 </SegmentBase>
             </Representation>''');
    }
    String mpd = '''<?xml version="1.0"?>
       <MPD xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
           xmlns="urn:mpeg:dash:schema:mpd:2011" xsi:schemaLocation="urn:mpeg:dash:schema:mpd:2011 DASH-MPD.xsd"
           type="static"
           mediaPresentationDuration="PT${dash.duration}S"
           minBufferTime="PT${dash.minBufferTime}S"
           profiles="http://dashif.org/guidelines/dash264,urn:mpeg:dash:profile:isoff-on-demand:2011">
           <Period>
           <AdaptationSet mimeType="video/mp4" contentType="video" subsegmentAlignment="true" subsegmentStartsWithSAP="1">
               ${videoRepresentationList.join('\n')}
           </AdaptationSet>
           <AdaptationSet mimeType="audio/mp4" contentType="audio" subsegmentAlignment="true" subsegmentStartsWithSAP="1">
               ${audioRepresentationList.join('\n')}
           </AdaptationSet>
           </Period>
        </MPD>''';
    debugPrint(mpd);
    return mpd;
  }
}
