import 'package:equatable/equatable.dart';

abstract class GeneratorEvent extends Equatable {
  const GeneratorEvent();

  @override
  List<Object> get props => [];
}

class Generate extends GeneratorEvent {
  const Generate();
}

class UseNumbers extends GeneratorEvent {
  const UseNumbers();
}

class DoNotUseNumbers extends GeneratorEvent {
  const DoNotUseNumbers();
}

class UseSymbols extends GeneratorEvent {
  const UseSymbols();
}

class DoNotUseSymbols extends GeneratorEvent {
  const DoNotUseSymbols();
}

class UseLowerCases extends GeneratorEvent {
  const UseLowerCases();
}

class DoNotUseLowerCases extends GeneratorEvent {
  const DoNotUseLowerCases();
}

class UseUpperCases extends GeneratorEvent {
  const UseUpperCases();
}

class DoNotUseUpperCases extends GeneratorEvent {
  const DoNotUseUpperCases();
}
