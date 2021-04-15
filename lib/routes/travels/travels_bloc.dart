import 'package:flutter_bloc/flutter_bloc.dart';

import './travels_event.dart';
import './travels_state.dart';

class TravelsBloc extends Bloc<TravelsEvent, TravelsState> {
  TravelsBloc() : super(const TravelsState());

  @override
  Stream<TravelsState> mapEventToState(TravelsEvent event) async* {
    var travels = state.travels;

    if (event is GetTravels) {
      yield TravelsState(travels: travels);
      if (event is GetTravel) {
        yield TravelsState(travel: travels[0].toJson());
      } else {
        throw Error();
      }
    }
  }

  @override
  void onChange(Change<TravelsState> change) {
    print(change);
    super.onChange(change);
  }
}
