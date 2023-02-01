import 'package:json_annotation/json_annotation.dart';

part 'mw_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class MwResponse<T> {
  final int code;
  final String msg;
  final T? data;

  MwResponse({required this.code, required this.msg, this.data});

  bool get success => code == 0;

  factory MwResponse.fromJson(
          Map<String, dynamic> srcJson, T Function(dynamic json) srcJsonT) =>
      _$MwResponseFromJson(srcJson, srcJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$MwResponseToJson(this, toJsonT);
}
