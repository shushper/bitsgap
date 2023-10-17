import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart' as another_flushbar_route;
import 'package:bitsgap/generated/codegen_loader.g.dart';
import 'package:bitsgap/res/color_schemes.dart';
import 'package:bitsgap/res/icons.dart';
import 'package:bitsgap/res/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'flushbar_args.dart';
import 'flushbar_type.dart';

const kFlushbarDuration = Duration(seconds: 2);

class FlushbarRoute extends another_flushbar_route.FlushbarRoute<void> {
  FlushbarRoute(RouteSettings rs)
      : super(
          settings: rs,
          flushbar: Flushbar(
            backgroundColor: getColor((rs.arguments as FlushbarArgs).type),
            flushbarPosition: FlushbarPosition.TOP,
            duration: kFlushbarDuration,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            borderRadius: BorderRadius.circular(12),
            flushbarStyle: FlushbarStyle.FLOATING,
            animationDuration: const Duration(milliseconds: 500),
            forwardAnimationCurve: Curves.fastOutSlowIn,
            reverseAnimationCurve: Curves.fastOutSlowIn,
            icon: SvgPicture.asset(getIcon((rs.arguments as FlushbarArgs).type)),
            titleText: Text(
              getTitle((rs.arguments as FlushbarArgs).type),
              textAlign: TextAlign.start,
              style: MyTextStyles.h6.copyWith(color: onFlushbarColor),
            ),
            messageText: Text(
              (rs.arguments as FlushbarArgs).message,
              textAlign: TextAlign.start,
              style: MyTextStyles.body2.copyWith(color: onFlushbarColor),
            ),
          ),
        );

  static String getIcon(FlushbarType type) {
    switch (type) {
      case FlushbarType.success:
        return MyIcons.flushbarSuccess;
      case FlushbarType.error:
        return MyIcons.flushbarError;
    }
  }

  static String getTitle(FlushbarType type) {
    switch (type) {
      case FlushbarType.success:
        return LocaleKeys.flushbar_success_title.tr();
      case FlushbarType.error:
        return LocaleKeys.flushbar_error_title.tr();
    }
  }

  static Color getColor(FlushbarType type) {
    switch (type) {
      case FlushbarType.success:
        return successColor;
      case FlushbarType.error:
        return errorColor;
    }
  }
}
