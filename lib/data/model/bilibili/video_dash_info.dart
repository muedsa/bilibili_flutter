import 'package:bilibili_flutter/data/model/bilibili/video_dash_representation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_dash_info.g.dart';

@JsonSerializable()
class VideoDashInfo {
  @JsonKey(name: 'duration')
  final int duration;

  @JsonKey(name: 'minBufferTime')
  final double minBufferTime;

  @JsonKey(name: 'video')
  final List<VideoDashRepresentation> video;

  @JsonKey(name: 'audio')
  final List<VideoDashRepresentation> audio;

  VideoDashInfo(
      {required this.duration,
      required this.minBufferTime,
      required this.video,
      required this.audio});

  VideoDashInfo filterVideoAudio(int? qn, String? codec) {
    return VideoDashInfo(
        duration: duration,
        minBufferTime: minBufferTime,
        video: video.where((element) {
          bool flag = true;
          if (qn != null) {
            flag = element.id == qn;
          }
          return flag;
        }).where((element) {
          bool flag = true;
          if (codec != null) {
            flag = element.codecs.contains(codec);
          }
          return flag;
        }).toList(),
        audio: [
          audio.reduce(
              (value, element) => element.id > value.id ? element : value)
        ]);
  }

  factory VideoDashInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$VideoDashInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoDashInfoToJson(this);
}
