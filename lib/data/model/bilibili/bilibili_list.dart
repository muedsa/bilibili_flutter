import 'package:json_annotation/json_annotation.dart';

part 'bilibili_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BilibiliList<T> {
  final List<T> list;

  @JsonKey(name: "no_more")
  final bool noMore;

  BilibiliList({required this.list, required this.noMore});

  factory BilibiliList.fromJson(
          Map<String, dynamic> srcJson, T Function(dynamic json) srcJsonT) =>
      _$BilibiliListFromJson(srcJson, srcJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BilibiliListToJson(this, toJsonT);
}
