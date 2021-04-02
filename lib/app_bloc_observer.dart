import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(Cubit cubit, Object error, StackTrace stacktrace) {
    super.onError(cubit, error, stacktrace);
    print('${cubit.runtimeType} $error | $stacktrace');
  }

  @override
  void onEvent(Cubit cubit, Object event) {
    super.onEvent(cubit, event);
    print(event);
  }

  @override
  void onTransition(Cubit cubit, Transition transition) {
    super.onTransition(cubit, transition);
    print(transition);
  }
}
