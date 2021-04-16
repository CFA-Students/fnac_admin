import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './routes/travels/travels_bloc.dart';
import './routes/travels/travels_event.dart';
import './routing/routes.dart';

class PpeAdminApp extends StatelessWidget {
  const PpeAdminApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TravelsBloc>(
          // lazy: false,
          create: (_) => TravelsBloc()..add(const GetTravels()),
        ),
      ],
      child: MaterialApp(
        onGenerateTitle: (context) => 'Fnac Admin',
        initialRoute: RouteGenerator.homePage,
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(primarySwatch: Colors.red),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
