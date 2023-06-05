// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bilibili_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BilibiliList<T> _$BilibiliListFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BilibiliList<T>(
      list: (json['list'] as List<dynamic>).map(fromJsonT).toList(),
      noMore: json['no_more'] as bool,
    );

Map<String, dynamic> _$BilibiliListToJson<T>(
  BilibiliList<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'list': instance.list.map(toJsonT).toList(),
      'no_more': instance.noMore,
    };
