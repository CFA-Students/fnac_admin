import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './routes/generator_config/generator_page.dart';
import './routes/home/home_page.dart';

class RouteGenerator {
  static const homePage = '/';
  static const passwordGeneratorPage = '/password-generator';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case passwordGeneratorPage:
        return MaterialPageRoute(builder: (_) => const PasswordGeneratorPage());
      default:
        throw FormatException("Routes not found");
    }
  }
}

class RouteExeption implements Exception {
  final String message;

  const RouteExeption(this.message);
}
