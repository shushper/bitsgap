import 'package:bitsgap/generated/codegen_loader.g.dart';
import 'package:bitsgap/res/images.dart';
import 'package:bitsgap/res/text_styles.dart';
import 'package:bitsgap/widgets/text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Stack(
        children: [
          Column(
            children: [
              ClipPath(
                clipper: const AuthScreenClipper(),
                child: Container(
                  height: 257,
                  color: colorScheme.secondary,
                ),
              ),
              Padding(
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
                      const SizedBox(height: 30),
                      const MySwitch(),
                      const SizedBox(height: 42),
                      const ForgotPassword(),
                    ],
                  ),
                ),
              ),
            ],
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

class MySwitch extends StatelessWidget {
  const MySwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: SwitchItem(
              text: LocaleKeys.auth_login_button.tr(),
              isSelected: true,
            ),
          ),
          Expanded(
            child: SwitchItem(
              text: LocaleKeys.auth_signup_button.tr(),
              isSelected: false,
            ),
          ),
        ],
      ),
    );
  }
}

class SwitchItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const SwitchItem({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = isSelected ? colorScheme.onPrimary : colorScheme.onSecondary;
    return Container(
      height: 40,
      decoration: isSelected
          ? BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(24),
            )
          : null,
      child: Center(
        child: Text(
          text,
          style: MyTextStyles.button.copyWith(color: textColor),
          textAlign: TextAlign.center,
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
    final brightness =Theme.of(context).brightness;
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
