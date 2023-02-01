import 'package:bilibili_flutter/data/model/bilibili/video_dash_segment_base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_dash_representation.g.dart';

@JsonSerializable()
class VideoDashRepresentation {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'baseUrl')
  final String baseUrl;

  // @JsonKey(name: 'backupUrl')
  // final List<String> backupUrl;

  @JsonKey(name: 'bandwidth')
  final int bandwidth;

  @JsonKey(name: 'mimeType')
  final String mimeType;

  @JsonKey(name: 'codecs')
  final String codecs;

  @JsonKey(name: 'width')
  final int width;

  @JsonKey(name: 'height')
  final int height;

  @JsonKey(name: 'frameRate')
  final String frameRate;

  @JsonKey(name: 'sar')
  final String sar;

  @JsonKey(name: 'startWithSap')
  final int startWithSap;

  @JsonKey(name: 'SegmentBase')
  final VideoDashSegmentBase segmentBase;

  @JsonKey(name: 'codecid')
  final int codeCid;

  VideoDashRepresentation(
      {required this.id,
      required this.baseUrl,
      //required this.backupUrl,
      required this.bandwidth,
      required this.mimeType,
      required this.codecs,
      required this.width,
      required this.height,
      required this.frameRate,
      required this.sar,
      required this.startWithSap,
      required this.segmentBase,
      required this.codeCid});

  factory VideoDashRepresentation.fromJson(Map<String, dynamic> srcJson) =>
      _$VideoDashRepresentationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoDashRepresentationToJson(this);
}
