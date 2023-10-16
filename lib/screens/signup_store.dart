import 'package:bitsgap/generated/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignUpStore = SignUpStoreBase with _$SignUpStore;

abstract class SignUpStoreBase with Store {
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
    if (email.isEmpty) {
      emailError = LocaleKeys.fields_errors_email_required.tr();
      return;
    } else if (!email.contains('@')) {
      emailError = LocaleKeys.fields_errors_email_invalid.tr();
      return;
    } else {
      emailError = null;
    }

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
