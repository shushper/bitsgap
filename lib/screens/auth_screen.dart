import 'package:bitsgap/app/injectable.dart';
import 'package:bitsgap/generated/codegen_loader.g.dart';
import 'package:bitsgap/res/images.dart';
import 'package:bitsgap/res/text_styles.dart';
import 'package:bitsgap/screens/auth_mode_store.dart';
import 'package:bitsgap/screens/login_store.dart';
import 'package:bitsgap/screens/signup_store.dart';
import 'package:bitsgap/widgets/text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'auth_mode.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _authModeStore = AuthModeStore();
  final _loginStore = getIt.get<LoginStore>();
  final _signupStore = getIt.get<SignUpStore>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: const AuthScreenClipper(),
                  child: Container(
                    height: 257,
                    color: colorScheme.secondary,
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 54,
                  child: SvgPicture.asset(Images.logo),
                )
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                FormsSwitcher(
                  authModeStore: _authModeStore,
                  loginStore: _loginStore,
                  signUpStore: _signupStore,
                ),
                const SizedBox(height: 30),
                AuthModeSwitcher(
                  authModeStore: _authModeStore,
                  loginStore: _loginStore,
                  signUpStore: _signupStore,
                ),
                const SizedBox(height: 42),
                const ForgotPassword(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FormsSwitcher extends StatelessWidget {
  final AuthModeStore authModeStore;
  final LoginStore loginStore;
  final SignUpStore signUpStore;

  const FormsSwitcher({super.key, required this.authModeStore, required this.signUpStore, required this.loginStore});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: PageView(
        controller: authModeStore.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          LoginForm(
            loginStore: loginStore,
          ),
          SingUpForm(
            signUpStore: signUpStore,
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final LoginStore loginStore;

  const LoginForm({super.key, required this.loginStore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: const ValueKey('loginFormKey'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Observer(builder: (context) {
              return MyTextField(
                hintText: LocaleKeys.auth_username_hint.tr(),
                onChanged: loginStore.setUsername,
                error: loginStore.userNameError,
              );
            }),
            const SizedBox(height: 12),
            Observer(
              builder: (context) {
                return MyTextField(
                  hintText: LocaleKeys.auth_password_hint.tr(),
                  onChanged: loginStore.setPassword,
                  error: loginStore.passwordError,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class SingUpForm extends StatelessWidget {
  final SignUpStore signUpStore;

  const SingUpForm({super.key, required this.signUpStore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: const ValueKey('signUpFormKey'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Observer(builder: (context) {
              return MyTextField(
                hintText: LocaleKeys.auth_email_hint.tr(),
                onChanged: signUpStore.setEmail,
                error: signUpStore.emailError,
              );
            }),
            const SizedBox(height: 12),
            Observer(builder: (context) {
              return MyTextField(
                hintText: LocaleKeys.auth_username_hint.tr(),
                onChanged: signUpStore.setUsername,
                error: signUpStore.userNameError,
              );
            }),
            const SizedBox(height: 12),
            Observer(builder: (context) {
              return MyTextField(
                hintText: LocaleKeys.auth_password_hint.tr(),
                onChanged: signUpStore.setPassword,
                error: signUpStore.passwordError,
              );
            }),
          ],
        ),
      ),
    );
  }
}

class AuthScreenClipper extends CustomClipper<Path> {
  const AuthScreenClipper();

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.6, size.height - 60);
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height - 80,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class AuthModeSwitcher extends StatelessWidget {
  final AuthModeStore authModeStore;
  final LoginStore loginStore;
  final SignUpStore signUpStore;

  const AuthModeSwitcher({super.key, required this.authModeStore, required this.loginStore, required this.signUpStore});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Observer(
        builder: (BuildContext context) {
          return Row(
            children: [
              Expanded(
                child: SwitchItem(
                  text: LocaleKeys.auth_login_button.tr(),
                  isSelected: authModeStore.authMode == AuthMode.login,
                  onTap: () {
                    if (authModeStore.authMode == AuthMode.login) {
                      loginStore.login();
                    } else {
                      authModeStore.setAuthMode(AuthMode.login);
                    }
                  },
                ),
              ),
              Expanded(
                child: SwitchItem(
                  text: LocaleKeys.auth_signup_button.tr(),
                  isSelected: authModeStore.authMode == AuthMode.signup,
                  onTap: () {
                    if (authModeStore.authMode == AuthMode.signup) {
                      signUpStore.signUp();
                    } else {
                      authModeStore.setAuthMode(AuthMode.signup);
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SwitchItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function() onTap;

  const SwitchItem({super.key, required this.text, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = isSelected ? colorScheme.onPrimary : colorScheme.onSecondary;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        duration: const Duration(milliseconds: 200),
        child: Center(
          child: Text(
            text,
            style: MyTextStyles.button.copyWith(color: textColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    final textColor = brightness == Brightness.light ? colorScheme.primary : colorScheme.onPrimary;

    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      child: Text(
        LocaleKeys.auth_forgot_password.tr(),
        style: MyTextStyles.button.copyWith(color: textColor),
      ),
    );
  }
}
