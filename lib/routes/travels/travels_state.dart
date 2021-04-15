import 'package:equatable/equatable.dart';

import '../../api/json_models/travel.dart';

class TravelsState extends Equatable {
  final List<Travel> travels;
  final Map<String, dynamic> travel;

  const TravelsState({
    travels,
    travel,
  })  : travels = const <Travel>[],
        travel = const {};

  @override
  List<Object> get props => [travels, travel];
}
