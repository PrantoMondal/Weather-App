import 'env_config.dart';

class BuildConfig {
  late final EnvConfig envConfig;
  bool _isInstantiated = false;

  static final BuildConfig instance = BuildConfig._internal();

  BuildConfig._internal();

  factory BuildConfig.instantiate({
    required EnvConfig config,
  }) {
    if (instance._isInstantiated) return instance;

    instance.envConfig = config;
    instance._isInstantiated = true;

    return instance;
  }
}
