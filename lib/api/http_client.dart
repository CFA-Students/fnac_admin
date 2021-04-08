import 'dart:html';

import './json_parsers/json_parser.dart';

class ResquestREST {
  final String endpoint;
  final Map<String, String> data;

  const ResquestREST({
    required this.endpoint,
    this.data = const {},
  });

  // static final _client = Dio();

  Future<T> executeGet<T>(JsonParser parser) async {
    // final response = await _client.get<String>(endpoint);
    // parser.parseFromJson(response.data);
    return Future.value();
  }

  Future<T> executePost<T>(JsonParser parser) async {
    // final formData = FormData.fromMap(data);
    // final response = await _client.post<String>(
    //   endpoint,
    //   data: formData,
    // );

    // return parser.parseFromJson(response.data);
    return Future.value();
  }
}
