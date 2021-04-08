// part 'travel.g.dart';

// @JsonSerializable()
class Travel {
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

  // factory Travel.fromJson(Map<String, dynamic> json) => _$TravelFromJson(json);

  // Map<String, dynamic> toJson() => _$TravelToJson(this);
}
