import 'package:json_annotation/json_annotation.dart';

part '../convert_from_json/name.g.dart';

@JsonSerializable()
class Name {
  String title,first,last;


  Name( { required this.title, required this.first,  required this.last});

  factory Name.fromJson(Map<String, dynamic> json)=> _$NameFromJson(json);

}