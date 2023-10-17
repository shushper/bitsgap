import 'package:flutter/cupertino.dart';

class AppNavigator {
  final _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<T?>? pushNamed<T>(String routeName, {Object? arguments}) {
    return _navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  Future<T?>? pushReplacementNamed<T>(String routeName, {Object? arguments}) {
    return _navigatorKey.currentState?.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<T?>? pushNamedAndRemoveUntil<T>(
    String routeName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return _navigatorKey.currentState?.pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop<T>({T? result}) {
    _navigatorKey.currentState?.pop(result);
  }

  void popUntil(RoutePredicate predicate) {
    _navigatorKey.currentState?.popUntil(predicate);
  }
}
