import 'package:flutter/material.dart';
import '../views/detail_page.dart';
import '../views/home_page.dart';

class AppRoutes {

  static Map<String, WidgetBuilder> routes() {
    return {
      "/": (context) => HomePage(),
      "detalle": (context) => DetallePage(),
    };
  }
}

