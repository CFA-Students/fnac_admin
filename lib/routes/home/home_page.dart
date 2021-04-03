// import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routing/drawer_menu.dart';
import './home_bloc.dart';
import './home_event.dart';
import './home_state.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key key, this.title = 'Home page'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: BlocProvider<CounterBloc>(
          // le Bloc à charger
          create: (_) => CounterBloc(),
          // et à chaque changement du Bloc (= données), ça va update automatiquement
          child: const ButtonsAndText(),
        ),
      ),
      drawer: const DrawerMenu(),
    );
  }
}

class ButtonsAndText extends StatelessWidget {
  const ButtonsAndText();

  Widget build(BuildContext context) {
    // ignore: close_sinks
    final counterBloc = context.read<CounterBloc>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Compteur basique :', style: const TextStyle(fontSize: 25)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              // envoi de l'event "Increment"
              onPressed: () => counterBloc.add(const Increment()),
              child: const Text(
                "+1",
                style: const TextStyle(color: Colors.green, fontSize: 25),
              ),
            ),
            // Affichage du state toujours à jour
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  "${state.count}",
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            TextButton(
              // envoi de l'event "Decrement"
              onPressed: () => counterBloc.add(const Decrement()),
              child: const Text(
                "-1",
                style: const TextStyle(color: Colors.red, fontSize: 25),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
