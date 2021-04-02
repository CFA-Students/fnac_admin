import 'package:flutter_bloc/flutter_bloc.dart';
import './home_event.dart';
import './home_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // On initialise le state dans la classe parente (compteur à 0 par défaut)
  CounterBloc() : super(const CounterState(0));

  @override
  // traduction : "transforme un Event en State(s)"
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is Increment) {
      final newCount = state.count + 1;
      yield CounterState(newCount);
    } else if (event is Decrement) {
      final newCount = state.count - 1;
      yield CounterState(newCount);
    }
  }

  @override
  void onChange(Change<CounterState> change) {
    print(change);
    super.onChange(change);
  }
}
