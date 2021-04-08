import '../json_models/travel.dart';
import './object_decoder.dart';
import './json_parser.dart';

class TravelParser extends JsonParser<List<Travel>>
    with ListDecoder<List<Travel>> {
  const TravelParser();

  @override
  Future<List<Travel>> parseFromJson(String json) async {
    return decodeJsonList(json)
        .map((value) => Travel.fromJson(value as Map<String, dynamic>))
        .toList();
  }
}
