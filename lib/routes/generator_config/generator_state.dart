import 'package:equatable/equatable.dart';

class GeneratorState extends Equatable {
  final String password;
  final bool useNumbers;
  final bool useSymbols;
  final bool useLowerCases;
  final bool useUpperCases;

  const GeneratorState({
    this.password = 'base',
    this.useNumbers = true,
    this.useSymbols = false,
    this.useLowerCases = true,
    this.useUpperCases = true,
  });

  @override
  List<Object> get props => [
        password,
        useNumbers,
        useSymbols,
        useLowerCases,
        useUpperCases,
      ];
}
