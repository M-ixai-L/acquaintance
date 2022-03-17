import 'package:json_annotation/json_annotation.dart';

part '../convert_from_json/dob.g.dart';

@JsonSerializable()
class Dob {
  String date;
  int age;

  Dob( { required this.date, required this.age});

  factory Dob.fromJson(Map<String, dynamic> json)=> _$DobFromJson(json);

}