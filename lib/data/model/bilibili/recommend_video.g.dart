// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendVideo _$RecommendVideoFromJson(Map<String, dynamic> json) =>
    RecommendVideo(
      aid: json['aid'] as int,
      videos: json['videos'] as int,
      tid: json['tid'] as int,
      tname: json['tname'] as String,
      copyright: json['copyright'] as int,
      pic: json['pic'] as String,
      title: json['title'] as String,
      pubdate: json['pubdate'] as int,
      ctime: json['ctime'] as int,
      desc: json['desc'] as String,
      state: json['state'] as int,
      duration: json['duration'] as int,
      missionId: json['mission_id'] as int?,
      owner: VideoOwner.fromJson(json['owner'] as Map<String, dynamic>),
      stat: VideoStat.fromJson(json['stat'] as Map<String, dynamic>),
      dynamicText: json['dynamic'] as String,
      cid: json['cid'] as int,
      dimension:
          VideoDimension.fromJson(json['dimension'] as Map<String, dynamic>),
      seasonId: json['season_id'] as int?,
      shortLinkV2: json['short_link_v2'] as String,
      upFromV2: json['up_from_v2'] as int?,
      firstFrame: json['first_frame'] as String,
      pubLocation: json['pub_location'] as String?,
      bvid: json['bvid'] as String,
      seasonType: json['season_type'] as int,
      isOgv: json['is_ogv'] as bool,
      rcmdReason:
          RecommendReason.fromJson(json['rcmd_reason'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecommendVideoToJson(RecommendVideo instance) =>
    <String, dynamic>{
      'aid': instance.aid,
      'videos': instance.videos,
      'tid': instance.tid,
      'tname': instance.tname,
      'copyright': instance.copyright,
      'pic': instance.pic,
      'title': instance.title,
      'pubdate': instance.pubdate,
      'ctime': instance.ctime,
      'desc': instance.desc,
      'state': instance.state,
      'duration': instance.duration,
      'mission_id': instance.missionId,
      'owner': instance.owner,
      'stat': instance.stat,
      'dynamic': instance.dynamicText,
      'cid': instance.cid,
      'dimension': instance.dimension,
      'season_id': instance.seasonId,
      'short_link_v2': instance.shortLinkV2,
      'up_from_v2': instance.upFromV2,
      'first_frame': instance.firstFrame,
      'pub_location': instance.pubLocation,
      'bvid': instance.bvid,
      'season_type': instance.seasonType,
      'is_ogv': instance.isOgv,
      'rcmd_reason': instance.rcmdReason,
    };
