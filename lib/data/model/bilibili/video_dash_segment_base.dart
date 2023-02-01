import 'package:json_annotation/json_annotation.dart';

part 'video_dash_segment_base.g.dart';


@JsonSerializable()
class VideoDashSegmentBase {
  @JsonKey(name: 'Initialization')
  final String initialization;

  @JsonKey(name: 'indexRange')
  final String indexRange;

  VideoDashSegmentBase(
      {required this.initialization, required this.indexRange});

  factory VideoDashSegmentBase.fromJson(Map<String, dynamic> srcJson) =>
      _$VideoDashSegmentBaseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoDashSegmentBaseToJson(this);
}
