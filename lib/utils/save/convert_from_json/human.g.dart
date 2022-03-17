// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../classes/human.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Human _$HumanFromJson(Map<String, dynamic> json) {
  return Human(
    name: Name.fromJson(json['name'] as Map<String, dynamic>),
    dob: Dob.fromJson(json['dob'] as Map<String, dynamic>),
    picture: Picture.fromJson(json['picture'] as Map<String, dynamic>),
    nationality: json['nat'] as String,
  );
}


