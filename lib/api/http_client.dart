import 'package:dio/dio.dart';

import './json_parsers/json_parser.dart';

class ResquestREST {
  final String endpoint;
  final Map<String, String> data;

  const ResquestREST({
    required this.endpoint,
    this.data = const {},
  });

  static final _client = Dio(
    BaseOptions(
      baseUrl: "http://localhost:3000/",
      connectTimeout: 3000,
      receiveTimeout: 3000,
    ),
  );

  Future<T> executeGet<T>(JsonParser<T> parser) async {
    final response = await _client.get<String>(endpoint);

    final json = response.data ?? '{}';
    return parser.parseFromJson(json);
  }

  Future<T> executePost<T>(JsonParser<T> parser) async {
    final formData = FormData.fromMap(data);
    final response = await _client.post<String>(
      endpoint,
      data: formData,
    );

    final json = response.data ?? '{}';
    return parser.parseFromJson(json);
  }
}
