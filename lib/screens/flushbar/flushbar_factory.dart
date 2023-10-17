import 'package:bitsgap/generated/codegen_loader.g.dart';
import 'package:bitsgap/screens/flushbar/flushbar_args.dart';
import 'package:bitsgap/screens/flushbar/flushbar_type.dart';
import 'package:easy_localization/easy_localization.dart';

class FlushbarFactory {
  static FlushbarArgs userRegistered() {
    return FlushbarArgs(
      message: LocaleKeys.flushbar_user_registered.tr(),
      type: FlushbarType.success,
    );
  }

  static FlushbarArgs userWithEmailExists(String email) {
    return FlushbarArgs(
      message: LocaleKeys.flushbar_user_with_email_exists.tr(
        args: [email],
      ),
      type: FlushbarType.error,
    );
  }

  static FlushbarArgs userWithUsernameExists(String username) {
    return FlushbarArgs(
      message: LocaleKeys.flushbar_user_with_username_exists.tr(
        args: [username],
      ),
      type: FlushbarType.error,
    );
  }

  static FlushbarArgs userNotFound() {
    return FlushbarArgs(
      message: LocaleKeys.flushbar_user_not_found.tr(),
      type: FlushbarType.error,
    );
  }

  static FlushbarArgs wrongPassword() {
    return FlushbarArgs(
      message: LocaleKeys.flushbar_wrong_password.tr(),
      type: FlushbarType.error,
    );
  }

  static FlushbarArgs userLoggedIn() {
    return FlushbarArgs(
      message: LocaleKeys.flushbar_user_logged_in.tr(),
      type: FlushbarType.success,
    );
  }
}
