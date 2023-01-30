// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_dash_representation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoDashRepresentation _$VideoDashRepresentationFromJson(
        Map<String, dynamic> json) =>
    VideoDashRepresentation(
      id: json['id'] as int,
      baseUrl: json['baseUrl'] as String,
      backupUrl: json['backupUrl'] as String,
      bandwidth: json['bandwidth'] as String,
      mimeType: json['mimeType'] as String,
      codecs: json['codecs'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      frameRate: json['frameRate'] as String,
      sar: json['sar'] as String,
      startWithSap: json['startWithSap'] as int,
      segmentBase: VideoDashSegmentBase.fromJson(
          json['SegmentBase'] as Map<String, dynamic>),
      codeCid: json['codecid'] as int,
    );

Map<String, dynamic> _$VideoDashRepresentationToJson(
        VideoDashRepresentation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'baseUrl': instance.baseUrl,
      'backupUrl': instance.backupUrl,
      'bandwidth': instance.bandwidth,
      'mimeType': instance.mimeType,
      'codecs': instance.codecs,
      'width': instance.width,
      'height': instance.height,
      'frameRate': instance.frameRate,
      'sar': instance.sar,
      'startWithSap': instance.startWithSap,
      'SegmentBase': instance.segmentBase,
      'codecid': instance.codeCid,
    };
