import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import './generator_event.dart';
import './generator_state.dart';

class GeneratorBloc extends Bloc<GeneratorEvent, GeneratorState> {
  final _numbers = '0123456789'.split('');
  final _symbols = '!"#\$%&\'()*+,-./:;<=>?@[\]^_`{|}~'.split('');
  final _lower = 'abcdefghijklmnopqrstuvwxyz'.split('');
  final _upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

  GeneratorBloc() : super(const GeneratorState());

  @override
  Stream<GeneratorState> mapEventToState(GeneratorEvent event) async* {
    var newPassword = state.password;
    var newUseNumbers = state.useNumbers;
    var newUseSymbols = state.useSymbols;
    var newUseLowerCases = state.useLowerCases;
    var newUseUpperCases = state.useUpperCases;

    if (event is UseNumbers) {
      newUseNumbers = true;
    } else if (event is DoNotUseNumbers) {
      newUseNumbers = false;
    } else if (event is UseSymbols) {
      newUseSymbols = true;
    } else if (event is DoNotUseSymbols) {
      newUseSymbols = false;
    } else if (event is UseLowerCases) {
      newUseLowerCases = true;
    } else if (event is DoNotUseLowerCases) {
      newUseLowerCases = false;
    } else if (event is UseUpperCases) {
      newUseUpperCases = true;
    } else if (event is DoNotUseUpperCases) {
      newUseUpperCases = false;
    } else if (event is Generate) {
      newPassword = this.generatePassword();
    } else {
      throw Error();
    }

    yield GeneratorState(
      password: newPassword,
      useNumbers: newUseNumbers,
      useSymbols: newUseSymbols,
      useLowerCases: newUseLowerCases,
      useUpperCases: newUseUpperCases,
    );
  }

  String generatePassword() {
    final config = <String>[];
    if (state.useNumbers) config.addAll(_numbers);
    if (state.useSymbols) config.addAll(_symbols);
    if (state.useLowerCases) config.addAll(_lower);
    if (state.useUpperCases) config.addAll(_upper);
    config.shuffle();

    final password = <String>[];
    if (config.length > 0)
      for (var i = 0; i < 10; i++)
        password.add(config[Random().nextInt(config.length)]);
    return password.join('').toString();
  }

  @override
  void onChange(Change<GeneratorState> change) {
    print(change);
    super.onChange(change);
  }
}
