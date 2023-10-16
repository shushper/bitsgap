import 'package:bitsgap/generated/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
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
    if (username.isEmpty) {
      userNameError = LocaleKeys.fields_errors_username_required.tr();
      return;
    } else {
      userNameError = null;
    }

    if (password.isEmpty) {
      passwordError = LocaleKeys.fields_errors_password_required.tr();
      return;
    } else if (password.length < 6) {
      passwordError = LocaleKeys.fields_errors_password_min_length.tr();
      return;
    } else {
      passwordError = null;
    }
  }
}
