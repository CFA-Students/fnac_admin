import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bloc_observer.dart';
import 'app.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const PpeAdminApp());
}

