// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelObject _$TravelObjectFromJson(Map<String, dynamic> json) {
  return TravelObject(
    (json['data'] as List<dynamic>)
        .map((e) => Travel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TravelObjectToJson(TravelObject instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Travel _$TravelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id']);
  return Travel(
    json['id'] as int,
    DateTime.parse(json['createdAt'] as String),
    DateTime.parse(json['updatedAt'] as String),
    json['agency'] as String,
    json['destination'] as String,
    (json['priceHt'] as num).toDouble(),
    (json['price'] as num).toDouble(),
    json['description'] as String,
    json['mainPhoto'] as String,
  );
}

Map<String, dynamic> _$TravelToJson(Travel instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'agency': instance.agency,
      'destination': instance.destination,
      'priceHt': instance.priceHt,
      'price': instance.price,
      'description': instance.description,
      'mainPhoto': instance.mainPhoto,
    };
