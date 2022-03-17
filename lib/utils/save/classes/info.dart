import 'package:json_annotation/json_annotation.dart';

part '../convert_from_json/info.g.dart';

@JsonSerializable()
class Info {
  String seed, version;
  int results;


  Info({ required this.seed, required this.results, required this.version});

  factory Info.fromJson(Map<String, dynamic> json)=> _$InfoFromJson(json);
}
