import 'package:json_annotation/json_annotation.dart';

part 'bilibili_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BiliBiliResponse<T> {
  final int code;
  final String message;
  final T? data;
  final int? ttl;

  BiliBiliResponse(
      {required this.code, required this.message, this.data, this.ttl});

  factory BiliBiliResponse.fromJson(
          Map<String, dynamic> srcJson, T Function(dynamic json) srcJsonT) =>
      _$BiliBiliResponseFromJson(srcJson, srcJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BiliBiliResponseToJson(this, toJsonT);
}
