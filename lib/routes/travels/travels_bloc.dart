import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/json_parsers/json_parser.dart';
import '../../api/http_client.dart';
import '../../api/json_models/travel.dart';
import './travels_event.dart';
import './travels_state.dart';

class TravelsBloc extends Bloc<TravelsEvent, TravelsState> {
  TravelsBloc() : super(TravelsState());

  @override
  Stream<TravelsState> mapEventToState(TravelsEvent event) async* {
    var travels = state.travels;

    if (event is GetTravels) {
      if (state.travels.length <= 0) {
        yield TravelsState(travels: await _getTravels());
      }
    } else if (event is GetTravel) {
      for (var travel in travels) {
        if (travel.id == event.id) {
          yield TravelsState(travel: travel);
        }
      }
    } else {
      throw Error();
    }
  }

  Future<List<Travel>> _getTravels() async =>
      await RequestREST(endpoint: '/travels')
          .executeGet<List<Travel>>(const TravelParser());

  @override
  void onChange(Change<TravelsState> change) {
    print(change);
    super.onChange(change);
  }
}
