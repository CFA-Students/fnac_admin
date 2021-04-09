import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import './json_parsers/json_parser.dart';

class RequestREST {
  final String endpoint;
  final Map<String, String> data;

  const RequestREST({
    required this.endpoint,
    this.data = const {},
  });

  static final _client = Dio(
    BaseOptions(
      baseUrl: "http://localhost:3000/",
      receiveDataWhenStatusError: true,
      // connectTimeout: 3000,
      // receiveTimeout: 3000,
    ),
  );

  Future<T> executeGet<T>(JsonParser<T> parser) async {
    // final response = await _client.get<String>(endpoint);
    // final json = response.data ?? '{}';

    final res = await http.get(Uri.http('localhost:3000', endpoint));
    final json = res.body;
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
