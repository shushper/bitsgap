import 'package:bitsgap/app/app_navigator.dart';
import 'package:bitsgap/app/app_routes.dart';
import 'package:bitsgap/repositories/auth_repository.dart';
import 'package:bitsgap/screens/flushbar/flushbar_factory.dart';
import 'package:bitsgap/utils/validator.dart';
import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignUpStore = SignUpStoreBase with _$SignUpStore;

abstract class SignUpStoreBase with Store {
  final Validator validator;
  final AuthRepository authRepository;
  final AppNavigator appNavigator;

  SignUpStoreBase(this.validator, this.authRepository, this.appNavigator);

  @observable
  String email = '';

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  String? emailError;

  @observable
  String? userNameError;

  @observable
  String? passwordError;

  @action
  void setEmail(String value) {
    email = value;
    emailError = null;
  }

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
  Future<void> signUp() async {
    final emailError = validator.validateEmail(email);
    if (emailError != null) {
      this.emailError = emailError;
      return;
    }

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

    await _registerUser();
  }

  Future<void> _registerUser() async {
    final result = await authRepository.registerUser(email, username, password);

    switch (result) {
      case RegisterResult.userWithEmailAlreadyExists:
        appNavigator.pushNamed(
          AppRoutes.flushbar,
          arguments: FlushbarFactory.userWithEmailExists(email),
        );
        break;
      case RegisterResult.userWithUsernameAlreadyExists:
        appNavigator.pushNamed(
          AppRoutes.flushbar,
          arguments: FlushbarFactory.userWithUsernameExists(username),
        );
        break;
      case RegisterResult.userRegistered:
        appNavigator.pushNamed(
          AppRoutes.flushbar,
          arguments: FlushbarFactory.userRegistered(),
        );
        break;
    }
  }
}
