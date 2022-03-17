import 'package:json_annotation/json_annotation.dart';

part '../convert_from_json/picture.g.dart';

@JsonSerializable()
class Picture {
  String large, medium, thumbnail;


  Picture( { required this.large, required this.medium, required this.thumbnail});

  factory Picture.fromJson(Map<String, dynamic> json)=> _$PictureFromJson(json);

}