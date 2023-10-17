import 'package:bitsgap/app/app_navigator.dart';
import 'package:bitsgap/app/app_routes.dart';
import 'package:bitsgap/repositories/auth_repository.dart';
import 'package:bitsgap/screens/flushbar/flushbar_factory.dart';
import 'package:bitsgap/screens/flushbar/flushbar_route.dart';
import 'package:bitsgap/utils/validator.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final Validator validator;
  final AuthRepository authRepository;
  final AppNavigator appNavigator;

  LoginStoreBase(this.validator, this.authRepository, this.appNavigator);

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  String? userNameError;

  @observable
  String? passwordError;

  @action
  void setUsername(String value) {
    username = value;
    userNameError = null;
  }

  @action
  void setPassword(String value) {
    password = value;
    passwordError = null;
  }

  @action
  Future<void> login() async {
    final userNameError = validator.validateUserName(username);
    if (userNameError != null) {
      this.userNameError = userNameError;
      return;
    }

    final passwordError = validator.validatePassword(password);
    if (passwordError != null) {
      this.passwordError = passwordError;
      return;
    }

    final result = await authRepository.loginUser(username, password);

    switch (result) {
      case LoginResult.userNotFound:
        appNavigator.pushNamed(
          AppRoutes.flushbar,
          arguments: FlushbarFactory.userNotFound(),
        );
        break;
      case LoginResult.wrongPassword:
        appNavigator.pushNamed(
          AppRoutes.flushbar,
          arguments: FlushbarFactory.wrongPassword(),
        );
        break;
      case LoginResult.userLoggedIn:
        appNavigator.pushNamed(
          AppRoutes.flushbar,
          arguments: FlushbarFactory.userLoggedIn(),
        );
        await Future.delayed(kFlushbarDuration);
        await authRepository.setAuthorized(true);
        appNavigator.pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
        break;
    }
  }
}
