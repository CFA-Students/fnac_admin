import 'package:flutter/material.dart';

import '../routes/home/home_page.dart';

class RouteGenerator {
  static const homePage = '/';
  static const passwordGeneratorPage = '/password-generator';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        throw FormatException("Routes not found");
    }
  }
}

class RouteExeption implements Exception {
  final String message;

  const RouteExeption(this.message);
}
