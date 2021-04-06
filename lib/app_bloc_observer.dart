import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase blocBase, Object error, StackTrace stacktrace) {
    super.onError(blocBase, error, stacktrace);
    print('${blocBase.runtimeType} $error | $stacktrace');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}
