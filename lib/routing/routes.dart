import 'package:flutter/material.dart';
import 'package:ppe_admin/routes/travels/travels_page.dart';

import '../routes/home/home_page.dart';

class RouteGenerator {
  static const homePage = '/';
  static const travelsPage = '/travels';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case travelsPage:
        return MaterialPageRoute(
          builder: (_) => const TravelsPage(),
        );
      default:
        throw FormatException('Routes not found');
    }
  }
}

// class RouteExeption implements Exception {
//   final String message;

//   const RouteExeption(this.message);
// }
