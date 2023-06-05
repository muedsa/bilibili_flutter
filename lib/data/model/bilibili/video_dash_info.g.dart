// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_dash_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoDashInfo _$VideoDashInfoFromJson(Map<String, dynamic> json) =>
    VideoDashInfo(
      duration: json['duration'] as int,
      minBufferTime: (json['minBufferTime'] as num).toDouble(),
      video: (json['video'] as List<dynamic>)
          .map((e) =>
              VideoDashRepresentation.fromJson(e as Map<String, dynamic>))
          .toList(),
      audio: (json['audio'] as List<dynamic>)
          .map((e) =>
              VideoDashRepresentation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoDashInfoToJson(VideoDashInfo instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'minBufferTime': instance.minBufferTime,
      'video': instance.video,
      'audio': instance.audio,
    };
