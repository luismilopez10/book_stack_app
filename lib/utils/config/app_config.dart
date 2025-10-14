import 'package:flutter/material.dart';

import '../constants/environment.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({
    required this.appName,
    required this.apiBaseUrl,
    required this.environment,
    required super.child,
    super.key,
  });

  final String appName;
  final String apiBaseUrl;
  final Environment environment;

  static AppConfig of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<AppConfig>()!;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
