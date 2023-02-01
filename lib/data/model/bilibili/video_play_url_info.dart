import 'package:bilibili_flutter/data/model/bilibili/media_format.dart';
import 'package:bilibili_flutter/data/model/bilibili/video_dash_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_play_url_info.g.dart';

@JsonSerializable()
class VideoPlayUrlInfo {
  final int quality;
  final String format;
  @JsonKey(name: 'timelength')
  final int timeLength;
  @JsonKey(name: 'accept_format')
  final String acceptFormat;

  @JsonKey(name: 'accept_description')
  final List<String> acceptDescription;

  @JsonKey(name: 'accept_quality')
  final List<int> acceptQuality;

  @JsonKey(name: 'video_codecid')
  final int videoCodeCid;

  @JsonKey(name: 'seek_param')
  final String seekParam;

  @JsonKey(name: 'seek_type')
  final String seekType;

  @JsonKey(name: 'dash')
  final VideoDashInfo dash;

  @JsonKey(name: 'support_formats')
  final List<MediaFormat> supportFormats;

  @JsonKey(name: 'last_play_time')
  final int lastPlayTime;

  @JsonKey(name: 'last_play_cid')
  final int lastPlayCid;

  VideoPlayUrlInfo(
      {required this.quality,
      required this.format,
      required this.acceptFormat,
      required this.timeLength,
      required this.acceptDescription,
      required this.acceptQuality,
      required this.videoCodeCid,
      required this.seekParam,
      required this.seekType,
      required this.dash,
      required this.supportFormats,
      required this.lastPlayTime,
      required this.lastPlayCid});

  factory VideoPlayUrlInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$VideoPlayUrlInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoPlayUrlInfoToJson(this);
}
