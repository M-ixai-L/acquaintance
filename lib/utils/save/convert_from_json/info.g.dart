// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../classes/info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(
    seed: json['seed'] as String,
    results: json['results'] as int,
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'seed': instance.seed,
      'version': instance.version,
      'results': instance.results,
    };
