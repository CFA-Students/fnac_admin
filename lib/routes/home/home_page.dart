// import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../routing/drawer_menu.dart';

class HomePage extends StatelessWidget {
  static const _title = 'Home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      drawer: const DrawerMenu(),
      body: const Center(child: const HomePageContent()),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent();

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text('Home Content')],
    );
  }
}
