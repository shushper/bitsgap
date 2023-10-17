import 'package:bitsgap/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';

class AuthRoute extends MaterialPageRoute {
  AuthRoute(RouteSettings rs)
      : super(
          settings: rs,
          builder: (context) => const AuthScreen(),
        );
}
