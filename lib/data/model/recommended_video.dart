import 'package:json_annotation/json_annotation.dart';

part 'recommended_video.g.dart';

@JsonSerializable()
class RecommendedVideo {
  final String bv;
  final String url;
  final String title;
  final String coverUrl;
  final int duration;
  final int publishTime;
  final int authorMid;
  final String author;
  final String authorFaceUrl;
  final int viewNum;
  final int likeNum;
  final int danmakuNum;

  RecommendedVideo(
      {required this.bv,
      required this.url,
      required this.title,
      required this.coverUrl,
      required this.duration,
      required this.publishTime,
      required this.authorMid,
      required this.author,
      required this.authorFaceUrl,
      required this.viewNum,
      required this.likeNum,
      required this.danmakuNum});

  factory RecommendedVideo.fromJson(Map<String, dynamic> srcJson) => _$RecommendedVideoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecommendedVideoToJson(this);
}
