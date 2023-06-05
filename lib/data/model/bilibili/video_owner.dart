import 'package:json_annotation/json_annotation.dart';

part 'video_owner.g.dart';

@JsonSerializable()
class VideoOwner {
  final int mid;
  final String name;
  final String face;

  VideoOwner({required this.mid, required this.name, required this.face});

  factory VideoOwner.fromJson(Map<String, dynamic> srcJson) =>
      _$VideoOwnerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoOwnerToJson(this);
}
