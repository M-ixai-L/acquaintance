// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../classes/result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    results: (json['results'] as List<dynamic>)
        .map((e) => Human.fromJson(e as Map<String, dynamic>))
        .toList(),
    info: Info.fromJson(json['info'] as Map<String, dynamic>),
  );
}


