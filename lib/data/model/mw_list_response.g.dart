// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mw_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MwListResponse<T> _$MwListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    MwListResponse<T>(
      code: json['code'] as int,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$MwListResponseToJson<T>(
  MwListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data?.map(toJsonT).toList(),
    };
