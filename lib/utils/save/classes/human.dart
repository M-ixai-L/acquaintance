
import 'package:json_annotation/json_annotation.dart';

import 'dob.dart';
import 'name.dart';
import 'picture.dart';

part '../convert_from_json/human.g.dart';

@JsonSerializable()
class Human {
    Name name;
    Dob dob;
    Picture picture;
    String nationality;
    Human( { required this.name, required this.dob,  required this.picture, required this.nationality});

    factory Human.fromJson(Map<String, dynamic> json) => _$HumanFromJson(json);

}