import 'package:bitsgap/generated/codegen_loader.g.dart';
import 'package:bitsgap/res/images.dart';
import 'package:bitsgap/res/text_styles.dart';
import 'package:bitsgap/screens/auth_mode_store.dart';
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

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  clipper: const AuthScreenClipper(),
                  child: Container(
                    height: 257,
                    color: colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    FormsSwitcher(
                      authModeStore: _authModeStore,
                    ),
                    const SizedBox(height: 30),
                    AuthModeSwitcher(
                      authModeStore: _authModeStore,
                    ),
                    const SizedBox(height: 42),
                    const ForgotPassword(),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 24,
            top: 54,
            child: SvgPicture.asset(Images.logo),
          )
        ],
      ),
    );
  }
}

class FormsSwitcher extends StatelessWidget {
  final AuthModeStore authModeStore;

  const FormsSwitcher({super.key, required this.authModeStore});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 46 * 3 + 12 * 2,
        child: PageView(
          controller: authModeStore.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            LoginForm(),
            SingUpForm(),
          ],
        ));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        child: Column(
          children: [
            const SizedBox(height: 46),
            const SizedBox(height: 12),
            MyTextField(
              hintText: LocaleKeys.auth_username_hint.tr(),
            ),
            const SizedBox(height: 12),
            MyTextField(
              hintText: LocaleKeys.auth_password_hint.tr(),
            ),
          ],
        ),
      ),
    );
  }
}

class SingUpForm extends StatefulWidget {
  const SingUpForm({super.key});

  @override
  State<SingUpForm> createState() => _SingUpFormState();
}

class _SingUpFormState extends State<SingUpForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        child: Column(
          children: [
            MyTextField(
              hintText: LocaleKeys.auth_email_hint.tr(),
            ),
            const SizedBox(height: 12),
            MyTextField(
              hintText: LocaleKeys.auth_username_hint.tr(),
            ),
            const SizedBox(height: 12),
            MyTextField(
              hintText: LocaleKeys.auth_password_hint.tr(),
            ),
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

  const AuthModeSwitcher({super.key, required this.authModeStore});

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
                  onTap: () => authModeStore.setAuthMode(AuthMode.login),
                ),
              ),
              Expanded(
                child: SwitchItem(
                  text: LocaleKeys.auth_signup_button.tr(),
                  isSelected: authModeStore.authMode == AuthMode.signup,
                  onTap: () => authModeStore.setAuthMode(AuthMode.signup),
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
