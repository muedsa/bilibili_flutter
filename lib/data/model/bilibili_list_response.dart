import 'package:json_annotation/json_annotation.dart';

part 'bilibili_list_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BiliBiliListResponse<T> {
  final int code;
  final String message;
  final List<T>? data;
  final int? ttl;

  BiliBiliListResponse(
      {required this.code, required this.message, this.data, this.ttl});

  factory BiliBiliListResponse.fromJson(
          Map<String, dynamic> srcJson, T Function(dynamic json) srcJsonT) =>
      _$BiliBiliListResponseFromJson(srcJson, srcJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BiliBiliListResponseToJson(this, toJsonT);
}
