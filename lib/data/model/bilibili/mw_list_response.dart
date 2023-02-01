import 'package:json_annotation/json_annotation.dart';

part 'mw_list_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class MwListResponse<T> {
  final int code;
  final String msg;
  final List<T>? data;

  const MwListResponse({
    required this.code,
    required this.msg,
    this.data
  });

  factory MwListResponse.fromJson(Map<String, dynamic> srcJson, T Function(dynamic json) srcJsonT) => _$MwListResponseFromJson(srcJson, srcJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$MwListResponseToJson(this, toJsonT);
}