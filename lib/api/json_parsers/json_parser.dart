library json_parser;

export './object_decoder.dart';
export './json_parser.dart';
export './travel_parser.dart';

abstract class JsonParser<T> {
  const JsonParser();

  Future<T> parseFromJson(String json);
}
