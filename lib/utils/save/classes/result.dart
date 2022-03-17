
import 'package:json_annotation/json_annotation.dart';

import 'human.dart';
import 'info.dart';

part '../convert_from_json/result.g.dart';

@JsonSerializable(explicitToJson: true)
class Result {
 List<Human> results;
 Info info;

 Result({ required this.results, required this.info});

 factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
