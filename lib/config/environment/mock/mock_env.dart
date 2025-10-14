import 'package:envied/envied.dart';

import '../interfaces/env_loader_interface.dart';

part 'mock_env.g.dart';

const String mockEnvPath = 'assets/configurations/mock/.env';

@Envied(path: mockEnvPath, obfuscate: true)
class MockEnv implements EnvLoaderInterface {
  @EnviedField(varName: 'APP_NAME')
  static final String appName = _MockEnv.appName;

  @EnviedField(varName: 'API_BASE_URL')
  static final String apiBaseUrl = _MockEnv.apiBaseUrl;

  @override
  String get envAppName => MockEnv.appName;

  @override
  String get envApiBaseUrl => MockEnv.apiBaseUrl;
}
