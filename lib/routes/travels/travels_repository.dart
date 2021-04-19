import 'package:flutter/foundation.dart';

import '/api/json_parsers/json_parser.dart';
import '/api/http_client.dart';
import '/api/json_models/travel.dart';

abstract class QueryRepository<T> {
  const QueryRepository();

  Future<List<T>> findAll();

  Future<T> find(int id);

  Future<void> update(int id);

  Future<void> delete(int id);
}

class TravelsRepository extends QueryRepository<Travel> {
  const TravelsRepository();

  @override
  Future<List<Travel>> findAll() async {
    try {
      return await RequestREST(endpoint: '/travels')
          .executeGet<List<Travel>>(const TravelsParser());
    } on Exception catch (e) {
      debugPrint(e.toString());
      return const <Travel>[];
    }
  }

  @override
  Future<Travel> find(int id) async {
    try {
      return await RequestREST(endpoint: '/travels/$id')
          .executeGet<Travel>(const TravelParser());
    } on Exception catch (e) {
      debugPrint(e.toString());
      return Travel(0, DateTime.now(), DateTime.now(), '', '', 0, 0, '', '');
    }
  }

  @override
  Future<void> update(int id) async {
    try {
      await RequestREST(endpoint: '/travels/$id')
          .executePost<Travel>(const TravelParser());
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await RequestREST(endpoint: '/travels/$id')
          .executePost<Travel>(const TravelParser());
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
