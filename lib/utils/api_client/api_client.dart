import 'package:acquaintance/utils/save/classes/result.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Result> getApiCallUsingHttp(Uri url) async {
  var response = await http.get(url);
  // ${saveNationalityList[(widget.choice?.indexNat)!]}
  // ${(widget.choice?.gender)!.toLowerCase()}
  if (response.statusCode == 200) {
    var data = response.body;
    var json = jsonDecode(data);
    Result result = Result.fromJson(json);

    return result;
  } else {
    throw Exception('Error');
  }
}