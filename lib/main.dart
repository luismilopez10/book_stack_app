import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/single_child_widget.dart';

import 'config/environment/env_loader.dart';
import 'config/environment/interfaces/env_loader_interface.dart';
import 'current_environment.dart';
import 'infrastructure/providers/all_providers.dart';
import 'theme/theme_notifier.dart';
import 'ui/helpers/routes/config_router/home_router.dart';
import 'ui/widgets/setup.dart';
import 'utils/config/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final EnvLoaderInterface envLoader = EnvLoader.getEnvironment();

  final ThemeNotifier themeNotifier = ThemeNotifier();

  final List<SingleChildWidget> providers = AllProviders.getAllProviders(
    env: CurrentEnvironment.env,
    themeNotifier: themeNotifier,
  );

  await themeNotifier.getSystemPreferences();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  const String initialRoute = HomeRouter.homeRouteName;

  final AppConfig appConfig = Setup.getApp(
    env: CurrentEnvironment.env,
    initialRoute: initialRoute,
    envLoader: envLoader,
    providers: providers,
  );

  runApp(appConfig);
}
