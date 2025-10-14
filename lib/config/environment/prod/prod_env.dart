import 'package:envied/envied.dart';

import '../interfaces/env_loader_interface.dart';

part 'prod_env.g.dart';

const String prodEnvPath = 'assets/configurations/prod/.env';

@Envied(path: prodEnvPath, obfuscate: true)
class ProdEnv implements EnvLoaderInterface {
  @EnviedField(varName: 'APP_NAME')
  static final String appName = _ProdEnv.appName;

  @EnviedField(varName: 'API_BASE_URL')
  static final String apiBaseUrl = _ProdEnv.apiBaseUrl;

  @override
  String get envAppName => ProdEnv.appName;

  @override
  String get envApiBaseUrl => ProdEnv.apiBaseUrl;
}
