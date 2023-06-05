import 'package:json_annotation/json_annotation.dart';

part 'video_stat.g.dart';

@JsonSerializable()
class VideoStat {
  final int aid;
  final int view;
  final int danmaku;
  final int reply;
  final int favorite;
  final int coin;
  final int share;
  @JsonKey(name: 'now_rank')
  final int nowRank;
  @JsonKey(name: 'his_rank')
  final int hisRank;
  final int like;
  final int dislike;
  final int vt;
  final int vv;

  VideoStat(
      {required this.aid,
      required this.view,
      required this.danmaku,
      required this.reply,
      required this.favorite,
      required this.coin,
      required this.share,
      required this.nowRank,
      required this.hisRank,
      required this.like,
      required this.dislike,
      required this.vt,
      required this.vv});

  factory VideoStat.fromJson(Map<String, dynamic> srcJson) =>
      _$VideoStatFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoStatToJson(this);
}
