// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_play_url_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoPlayUrlInfo _$VideoPlayUrlInfoFromJson(Map<String, dynamic> json) =>
    VideoPlayUrlInfo(
      quality: json['quality'] as int,
      format: json['format'] as String,
      acceptFormat: json['accept_format'] as String,
      timeLength: json['timelength'] as int,
      acceptDescription: (json['acceptDescription'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      acceptQuality: (json['accept_quality'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      videoCodeCid: json['video_codecid'] as int,
      seekParam: json['seek_param'] as String,
      seekType: json['seek_type'] as String,
      dash: VideoPlayUrlInfo.fromJson(json['dash'] as Map<String, dynamic>),
      supportFormats: (json['support_formats'] as List<dynamic>)
          .map((e) => MediaFormat.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPlayTime: json['last_play_time'] as int,
      lastPlayCid: json['last_play_cid'] as int,
    );

Map<String, dynamic> _$VideoPlayUrlInfoToJson(VideoPlayUrlInfo instance) =>
    <String, dynamic>{
      'quality': instance.quality,
      'format': instance.format,
      'timelength': instance.timeLength,
      'accept_format': instance.acceptFormat,
      'acceptDescription': instance.acceptDescription,
      'accept_quality': instance.acceptQuality,
      'video_codecid': instance.videoCodeCid,
      'seek_param': instance.seekParam,
      'seek_type': instance.seekType,
      'dash': instance.dash,
      'support_formats': instance.supportFormats,
      'last_play_time': instance.lastPlayTime,
      'last_play_cid': instance.lastPlayCid,
    };
