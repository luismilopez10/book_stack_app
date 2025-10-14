import 'dart:async';

import 'package:flutter/widgets.dart';

import '../enums/navigation_type.dart';

extension NavigationExtension on BuildContext {
  void navigateTo(
    String routeName, {
    NavigationType navigationType = NavigationType.push,
    VoidCallback? onBeforeNavigation,
    String? keepUntilRouteName,
  }) {
    onBeforeNavigation?.call();

    switch (navigationType) {
      case NavigationType.push:
        unawaited(
          Navigator.pushNamed(this, routeName),
        );

      case NavigationType.pushReplacement:
        unawaited(
          Navigator.pushReplacementNamed(this, routeName),
        );

      case NavigationType.pushAndRemoveUntil:
        unawaited(
          Navigator.pushNamedAndRemoveUntil(
            this,
            routeName,
            keepUntilRouteName != null
                ? ModalRoute.withName(keepUntilRouteName)
                : (Route<dynamic> route) => false,
          ),
        );

      case NavigationType.popAndPush:
        unawaited(
          Navigator.popAndPushNamed(this, routeName),
        );

      case NavigationType.popUntil:
        Navigator.popUntil(
          this,
          ModalRoute.withName(routeName),
        );
    }
  }
}
