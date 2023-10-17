import 'package:bitsgap/repositories/auth_repository.dart';
import 'package:bitsgap/utils/validator.dart';
import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignUpStore = SignUpStoreBase with _$SignUpStore;

abstract class SignUpStoreBase with Store {
  final Validator validator;
  final AuthRepository authRepository;

  SignUpStoreBase(this.validator, this.authRepository);

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

    await authRepository.registerUser(email, username, password);
  }
}
