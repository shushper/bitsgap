import 'package:flutter/material.dart';

import 'home_screen.dart';

class HomeRoute extends MaterialPageRoute<void> {
  HomeRoute(RouteSettings rs)
      : super(
          settings: rs,
          builder: (context) => const HomeScreen(),
        );
}
