import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './generator_bloc.dart';
import './generator_state.dart';
import './generator_event.dart';

class PasswordGeneratorPage extends StatelessWidget {
  const PasswordGeneratorPage({Key key}) : super(key: key);

  @override
  Widget build(_) {
    return Scaffold(
      appBar: AppBar(title: const Text('Generator')),
      body: Center(
        child: BlocProvider<GeneratorBloc>(
          create: (_) => GeneratorBloc(),
          child: const ButtonsAndPassword(),
        ),
      ),
    );
  }
}

class ButtonsAndPassword extends StatelessWidget {
  const ButtonsAndPassword();

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final generatorBloc = context.read<GeneratorBloc>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<GeneratorBloc, GeneratorState>(
              builder: (context, state) {
                final numbers = generatorBloc.state.useNumbers;
                return TextButton(
                  onPressed: () => (numbers)
                      ? generatorBloc.add(const DoNotUseNumbers())
                      : generatorBloc.add(const UseNumbers()),
                  child: Text(
                    "Numbers",
                    style: TextStyle(
                      color: numbers ? Colors.blue : Colors.grey,
                      fontSize: 25,
                    ),
                  ),
                );
              },
            ),
            BlocBuilder<GeneratorBloc, GeneratorState>(
              builder: (context, state) {
                final symbols = generatorBloc.state.useSymbols;
                return TextButton(
                  onPressed: () => (symbols)
                      ? generatorBloc.add(const DoNotUseSymbols())
                      : generatorBloc.add(const UseSymbols()),
                  child: Text(
                    "Symbols",
                    style: TextStyle(
                      color: symbols ? Colors.blue : Colors.grey,
                      fontSize: 25,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<GeneratorBloc, GeneratorState>(
              builder: (context, state) {
                final lower = generatorBloc.state.useLowerCases;
                return TextButton(
                  onPressed: () => (lower)
                      ? generatorBloc.add(const DoNotUseLowerCases())
                      : generatorBloc.add(const UseLowerCases()),
                  child: Text(
                    "Lower cases",
                    style: TextStyle(
                      color: lower ? Colors.blue : Colors.grey,
                      fontSize: 25,
                    ),
                  ),
                );
              },
            ),
            BlocBuilder<GeneratorBloc, GeneratorState>(
              builder: (context, state) {
                final upper = generatorBloc.state.useUpperCases;
                return TextButton(
                  onPressed: () => (upper)
                      ? generatorBloc.add(const DoNotUseUpperCases())
                      : generatorBloc.add(const UseUpperCases()),
                  child: Text(
                    "Upper cases",
                    style: TextStyle(
                      color: upper ? Colors.blue : Colors.grey,
                      fontSize: 25,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () => generatorBloc.add(const Generate()),
              child: const Text(
                "Generate password",
                style: const TextStyle(color: Colors.red, fontSize: 30),
              ),
            ),
          ],
        ),
        BlocBuilder<GeneratorBloc, GeneratorState>(
          builder: (context, state) {
            return Text(
              "${state.password}",
              style: const TextStyle(fontSize: 30),
            );
          },
        ),
      ],
    );
  }
}
