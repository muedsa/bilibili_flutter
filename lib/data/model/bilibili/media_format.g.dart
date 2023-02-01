// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaFormat _$MediaFormatFromJson(Map<String, dynamic> json) => MediaFormat(
      quality: json['quality'] as int,
      format: json['format'] as String,
      newDescription: json['new_description'] as String,
      displayDesc: json['display_desc'] as String,
      superScript: json['superscript'] as String,
      codecs:
          (json['codecs'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MediaFormatToJson(MediaFormat instance) =>
    <String, dynamic>{
      'quality': instance.quality,
      'format': instance.format,
      'new_description': instance.newDescription,
      'display_desc': instance.displayDesc,
      'superscript': instance.superScript,
      'codecs': instance.codecs,
    };
