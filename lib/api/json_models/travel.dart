import 'package:json_annotation/json_annotation.dart';

part 'travel.g.dart';

@JsonSerializable(explicitToJson: true)
class TravelObject {
  final List<Travel> data;

  const TravelObject(this.data);

  factory TravelObject.fromJson(Map<String, dynamic> json) =>
      _$TravelObjectFromJson(json);

  Map<String, dynamic> toJson() => _$TravelObjectToJson(this);
}

@JsonSerializable()
class Travel {
  @JsonKey(required: true)
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String agency;
  final String destination;
  final double priceHt;
  final double price;
  final String description;
  final String mainPhoto;

  const Travel(
    this.id,
    this.createdAt,
    this.updatedAt,
    this.agency,
    this.destination,
    this.priceHt,
    this.price,
    this.description,
    this.mainPhoto,
  );

  factory Travel.fromJson(Map<String, dynamic> json) => _$TravelFromJson(json);

  Map<String, dynamic> toJson() => _$TravelToJson(this);

  // @override
  // String toString() => 'travel n $this.id: ${this.destination}, ${this.createdAt} and ${this.updatedAt}';
}
