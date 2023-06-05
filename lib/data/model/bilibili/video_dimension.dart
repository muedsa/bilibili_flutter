import 'package:json_annotation/json_annotation.dart';

part 'video_dimension.g.dart';

@JsonSerializable()
class VideoDimension {
  final int width;
  final int height;
  final int rotate;

  VideoDimension({
    required this.width,
    required this.height,
    required this.rotate,
  });

  factory VideoDimension.fromJson(Map<String, dynamic> srcJson) =>
      _$VideoDimensionFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoDimensionToJson(this);
}
