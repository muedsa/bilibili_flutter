// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoStat _$VideoStatFromJson(Map<String, dynamic> json) => VideoStat(
      aid: json['aid'] as int,
      view: json['view'] as int,
      danmaku: json['danmaku'] as int,
      reply: json['reply'] as int,
      favorite: json['favorite'] as int,
      coin: json['coin'] as int,
      share: json['share'] as int,
      nowRank: json['now_rank'] as int,
      hisRank: json['his_rank'] as int,
      like: json['like'] as int,
      dislike: json['dislike'] as int,
      vt: json['vt'] as int,
      vv: json['vv'] as int,
    );

Map<String, dynamic> _$VideoStatToJson(VideoStat instance) => <String, dynamic>{
      'aid': instance.aid,
      'view': instance.view,
      'danmaku': instance.danmaku,
      'reply': instance.reply,
      'favorite': instance.favorite,
      'coin': instance.coin,
      'share': instance.share,
      'now_rank': instance.nowRank,
      'his_rank': instance.hisRank,
      'like': instance.like,
      'dislike': instance.dislike,
      'vt': instance.vt,
      'vv': instance.vv,
    };
