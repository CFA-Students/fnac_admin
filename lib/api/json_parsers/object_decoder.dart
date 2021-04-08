import 'dart:convert';

import 'json_parser.dart';

mixin ObjectDecoder<T> on JsonParser<T> {
  Map<String, dynamic> decodeJsonObject(String json) =>
      jsonDecode(json) as Map<String, dynamic>;
}

mixin ListDecoder<T> on JsonParser<T> {
  List<dynamic> decodeJsonList(String json) =>
      jsonDecode(json) as List<dynamic>;
}
