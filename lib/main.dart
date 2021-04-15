import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './app_bloc_observer.dart';
import './routing/routes.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const PpeAdminApp());
}

class PpeAdminApp extends StatelessWidget {
  const PpeAdminApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => 'Fnac Admin',
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
    );
  }
}
