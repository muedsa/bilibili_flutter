// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendedVideo _$RecommendedVideoFromJson(Map<String, dynamic> json) =>
    RecommendedVideo(
      bv: json['bv'] as String,
      cid: json['cid'] as int,
      url: json['url'] as String,
      title: json['title'] as String,
      coverUrl: json['coverUrl'] as String,
      duration: json['duration'] as int,
      publishTime: json['publishTime'] as int,
      authorMid: json['authorMid'] as int,
      author: json['author'] as String,
      authorFaceUrl: json['authorFaceUrl'] as String,
      viewNum: json['viewNum'] as int,
      likeNum: json['likeNum'] as int,
      danmakuNum: json['danmakuNum'] as int,
    );

Map<String, dynamic> _$RecommendedVideoToJson(RecommendedVideo instance) =>
    <String, dynamic>{
      'bv': instance.bv,
      'cid': instance.cid,
      'url': instance.url,
      'title': instance.title,
      'coverUrl': instance.coverUrl,
      'duration': instance.duration,
      'publishTime': instance.publishTime,
      'authorMid': instance.authorMid,
      'author': instance.author,
      'authorFaceUrl': instance.authorFaceUrl,
      'viewNum': instance.viewNum,
      'likeNum': instance.likeNum,
      'danmakuNum': instance.danmakuNum,
    };
