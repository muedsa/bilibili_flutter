import 'package:bilibili_flutter/data/model/video_dash_representation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_dash_info.g.dart';

@JsonSerializable()
class VideoDashInfo {
  @JsonKey(name: 'duration')
  final int duration;

  @JsonKey(name: 'minBufferTime')
  final int minBufferTime;

  @JsonKey(name: 'video')
  final List<VideoDashRepresentation> video;

  @JsonKey(name: 'audio')
  final List<VideoDashRepresentation> audio;

  VideoDashInfo(
      {required this.duration,
      required this.minBufferTime,
      required this.video,
      required this.audio});

  factory VideoDashInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$VideoDashInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoDashInfoToJson(this);
}
