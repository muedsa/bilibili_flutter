import 'package:bilibili_flutter/data/model/bilibili/recommend_reason.dart';
import 'package:bilibili_flutter/data/model/bilibili/video_dimension.dart';
import 'package:bilibili_flutter/data/model/bilibili/video_owner.dart';
import 'package:bilibili_flutter/data/model/bilibili/video_stat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recommend_video.g.dart';

@JsonSerializable()
class RecommendVideo {
  final int aid;
  final int videos;
  final int tid;
  final String tname;
  final int copyright;
  final String pic;
  final String title;
  final int pubdate;
  final int ctime;
  final String desc;
  final int state;
  final int duration;
  @JsonKey(name: 'mission_id')
  final int? missionId;
  //final Rights rights;
  final VideoOwner owner;
  final VideoStat stat;
  @JsonKey(name: 'dynamic')
  final String dynamicText;
  final int cid;
  final VideoDimension dimension;
  @JsonKey(name: 'season_id')
  final int? seasonId;
  @JsonKey(name: 'short_link_v2')
  final String shortLinkV2;
  @JsonKey(name: 'up_from_v2')
  final int? upFromV2;
  @JsonKey(name: 'first_frame')
  final String firstFrame;
  @JsonKey(name: 'pub_location')
  final String? pubLocation;
  final String bvid;
  @JsonKey(name: 'season_type')
  final int seasonType;
  @JsonKey(name: 'is_ogv')
  final bool isOgv;
  //final void ogvInfo;
  @JsonKey(name: 'rcmd_reason')
  final RecommendReason rcmdReason;

  RecommendVideo(
      {required this.aid,
      required this.videos,
      required this.tid,
      required this.tname,
      required this.copyright,
      required this.pic,
      required this.title,
      required this.pubdate,
      required this.ctime,
      required this.desc,
      required this.state,
      required this.duration,
      required this.missionId,
      required this.owner,
      required this.stat,
      required this.dynamicText,
      required this.cid,
      required this.dimension,
      required this.seasonId,
      required this.shortLinkV2,
      required this.upFromV2,
      required this.firstFrame,
      required this.pubLocation,
      required this.bvid,
      required this.seasonType,
      required this.isOgv,
      required this.rcmdReason});

  factory RecommendVideo.fromJson(Map<String, dynamic> srcJson) =>
      _$RecommendVideoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecommendVideoToJson(this);
}
