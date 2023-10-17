import 'package:bitsgap/screens/auth/auth_route.dart';
import 'package:bitsgap/screens/flushbar/flushbar_route.dart';
import 'package:bitsgap/screens/home/home_route.dart';
import 'package:flutter/material.dart';

typedef RouteGenerator = Route<dynamic> Function(RouteSettings rs);

class AppRoutes {
  static const String auth = 'auth';
  static const String flushbar = 'flushbar';
  static const String home = 'home';

  static final Map<String, RouteGenerator> _generators = {
    AppRoutes.auth: (rs) => AuthRoute(rs),
    AppRoutes.flushbar: (rs) => FlushbarRoute(rs),
    AppRoutes.home: (rs) => HomeRoute(rs),
  };

  static Route<dynamic>? generateRoute(RouteSettings rs) {
    final generator = _generators[rs.name];
    if (generator != null) {
      return generator(rs);
    }
    return null;
  }
}
