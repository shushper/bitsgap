import 'package:bitsgap/screens/auth/auth_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'auth_mode_store.g.dart';

class AuthModeStore = AuthModeBaseStore with _$AuthModeStore;

abstract class AuthModeBaseStore with Store {
  @observable
  AuthMode authMode = AuthMode.login;

  final PageController pageController = PageController(initialPage: 0);

  @action
  void setAuthMode(AuthMode mode) {
    authMode = mode;

    switch (mode) {
      case AuthMode.login:
        pageController.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
        break;
      case AuthMode.signup:
        pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
        break;
    }
  }

}