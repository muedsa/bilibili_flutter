// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_reason.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendReason _$RecommendReasonFromJson(Map<String, dynamic> json) =>
    RecommendReason(
      content: json['content'] as String,
      cornerMark: json['corner_mark'] as int,
    );

Map<String, dynamic> _$RecommendReasonToJson(RecommendReason instance) =>
    <String, dynamic>{
      'content': instance.content,
      'cornerMark': instance.cornerMark,
    };
