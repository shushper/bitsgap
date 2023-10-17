import 'package:bitsgap/screens/flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

typedef RouteGenerator = Route<dynamic> Function(RouteSettings rs);

class AppRoutes {
  static const String flushbar = 'flushbar';

  static final Map<String, RouteGenerator> _generators = {
    AppRoutes.flushbar: (rs) => FlushbarRoute(rs),
  };

  static Route<dynamic>? generateRoute(RouteSettings rs) {
    final generator = _generators[rs.name];
    if (generator != null) {
      return generator(rs);
    }
    return null;
  }
}
