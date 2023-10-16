import 'package:bitsgap/res/text_styles.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  const MyTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TextFormField(
      style: MyTextStyles.body1.copyWith(color: colorScheme.onBackground),
      decoration: InputDecoration(
        hintText: hintText,
        constraints: const BoxConstraints(
          maxHeight: 46,
        ),
        hintStyle: MyTextStyles.body1.copyWith(color: colorScheme.onBackground.withOpacity(0.5)),
        contentPadding: const EdgeInsets.only(left: 16, right: 32),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: colorScheme.primary.withOpacity(0.5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: colorScheme.primary.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
              color: colorScheme.primary,
          ),
        ),
      )
    );
  }
}
