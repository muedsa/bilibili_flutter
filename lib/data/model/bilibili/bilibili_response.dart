import 'package:json_annotation/json_annotation.dart';

part 'bilibili_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BilibiliResponse<T> {
  final int code;
  final String message;
  final T? data;
  final int? ttl;

  BilibiliResponse(
      {required this.code, required this.message, this.data, this.ttl});

  bool get success => code == 0;

  factory BilibiliResponse.fromJson(
          Map<String, dynamic> srcJson, T Function(dynamic json) srcJsonT) =>
      _$BilibiliResponseFromJson(srcJson, srcJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BilibiliResponseToJson(this, toJsonT);
}
