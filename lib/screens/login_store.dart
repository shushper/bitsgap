import 'package:bitsgap/utils/validator.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {

  //should be injected
  final validator = Validator();

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
  }
}
