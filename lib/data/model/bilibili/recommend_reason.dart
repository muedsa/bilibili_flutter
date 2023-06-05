import 'package:json_annotation/json_annotation.dart';

part 'recommend_reason.g.dart';

@JsonSerializable()
class RecommendReason {
  final String content;
  @JsonKey(name: 'corner_mark')
  final int cornerMark;

  RecommendReason({required this.content, required this.cornerMark});

  factory RecommendReason.fromJson(Map<String, dynamic> srcJson) =>
      _$RecommendReasonFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecommendReasonToJson(this);
}
