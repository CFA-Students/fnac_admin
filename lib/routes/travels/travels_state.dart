import 'package:equatable/equatable.dart';

import '/api/json_models/travel.dart';

class TravelsState extends Equatable {
  final List<Travel> travels;
  final Travel? travel;

  const TravelsState({
    this.travels = const <Travel>[],
    this.travel,
  });

  @override
  List<Object?> get props => [travels, travel];
}
