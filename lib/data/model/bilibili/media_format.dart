import 'package:json_annotation/json_annotation.dart';

part 'media_format.g.dart';

@JsonSerializable()
class MediaFormat {
  @JsonKey(name: 'quality')
  final int quality;

  @JsonKey(name: 'format')
  final String format;

  @JsonKey(name: 'new_description')
  final String newDescription;

  @JsonKey(name: 'display_desc')
  final String displayDesc;

  @JsonKey(name: 'superscript')
  final String superScript;

  @JsonKey(name: 'codecs')
  final List<String> codecs;

  MediaFormat(
      {required this.quality,
      required this.format,
      required this.newDescription,
      required this.displayDesc,
      required this.superScript,
      required this.codecs});

  factory MediaFormat.fromJson(Map<String, dynamic> srcJson) =>
      _$MediaFormatFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MediaFormatToJson(this);
}
