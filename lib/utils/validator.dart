import 'package:bitsgap/generated/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';

const int _passwordMinLength = 6;
const int _usernameMinLength = 6;

class Validator {
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return LocaleKeys.fields_errors_email_required.tr();
    } else if (!EmailValidator.validate(email)) {
      return LocaleKeys.fields_errors_email_invalid.tr();
    } else {
      return null;
    }
  }

  String? validateUserName(String username) {
    if (username.isEmpty) {
      return LocaleKeys.fields_errors_username_required.tr();
    } else if (username.length < _usernameMinLength) {
      return LocaleKeys.fields_errors_username_min_length.tr(args: [_usernameMinLength.toString()]);
    } else {
      return null;
    }
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return LocaleKeys.fields_errors_password_required.tr();
    } else if (password.length < _passwordMinLength) {
      return LocaleKeys.fields_errors_password_min_length.tr(args: [_passwordMinLength.toString()]);
    } else {
      return null;
    }
  }
}
