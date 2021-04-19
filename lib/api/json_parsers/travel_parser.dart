import '../json_models/travel.dart';
import './object_decoder.dart';
import './json_parser.dart';

class TravelsParser extends JsonParser<List<Travel>>
    with ListDecoder<List<Travel>> {
  const TravelsParser();

  @override
  Future<List<Travel>> parseFromJson(String json) async {
    return decodeJsonList(json)
        .map((value) => Travel.fromJson(value as Map<String, dynamic>))
        .toList();
  }
}

class TravelParser extends JsonParser<Travel> with ObjectDecoder<Travel> {
  const TravelParser();

  @override
  Future<Travel> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return Travel.fromJson(decoded);
  }
}
