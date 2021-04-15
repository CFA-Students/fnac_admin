import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import './json_parsers/json_parser.dart';

class RequestREST {
  final Map<String, String> data;
  final String endpoint;

  static const _API_URL = 'http://10.0.2.2:3000/';

  static final _client = Dio(
    BaseOptions(
      baseUrl: _API_URL,
      receiveDataWhenStatusError: true,
      connectTimeout: 3000,
      receiveTimeout: 3000,
    ),
  )..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        compact: true,
      ),
    );

  const RequestREST({
    required this.endpoint,
    this.data = const {},
  });

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
