import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../config/environment/interfaces/env_loader_interface.dart';
import '../../utils/config/app_config.dart';
import '../../utils/constants/environment.dart';
import 'app.dart';

class Setup {
  static AppConfig getApp({
    required Environment env,
    required String initialRoute,
    required List<SingleChildWidget> providers,
    required EnvLoaderInterface envLoader,
  }) {
    return AppConfig(
      appName: envLoader.envAppName,
      apiBaseUrl: envLoader.envApiBaseUrl,
      environment: env,
      child: MultiProvider(
        providers: providers,
        child: App(initialRoute: initialRoute),
      ),
    );
  }
}
