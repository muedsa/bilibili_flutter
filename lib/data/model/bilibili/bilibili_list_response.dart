import 'package:json_annotation/json_annotation.dart';

part 'bilibili_list_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BilibiliListResponse<T> {
  final int code;
  final String message;
  final List<T>? data;
  final int? ttl;

  BilibiliListResponse(
      {required this.code, required this.message, this.data, this.ttl});

  bool get success => code == 0;

  factory BilibiliListResponse.fromJson(
          Map<String, dynamic> srcJson, T Function(dynamic json) srcJsonT) =>
      _$BilibiliListResponseFromJson(srcJson, srcJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BilibiliListResponseToJson(this, toJsonT);
}
