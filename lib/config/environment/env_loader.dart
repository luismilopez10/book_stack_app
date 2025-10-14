import '../../../current_environment.dart';
import '../../utils/constants/environment.dart';
import 'interfaces/env_loader_interface.dart';
import 'mock/mock_env.dart';
import 'prod/prod_env.dart';

class EnvLoader {
  static final Map<Environment, EnvLoaderInterface> _cache =
      <Environment, EnvLoaderInterface>{};

  static EnvLoaderInterface getEnvironment({
    Environment env = CurrentEnvironment.env,
  }) {
    if (!_cache.containsKey(env)) {
      _cache[env] = switch (env) {
        Environment.Mock => MockEnv(),
        Environment.Production => ProdEnv(),
      };
    }

    return _cache[env] ?? (throw Exception('No env found in cache'));
  }
}
