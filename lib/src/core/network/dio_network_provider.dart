import 'package:dio/dio.dart';
import 'package:weather_app/src/core/config/build_config.dart';

class NetworkProvider {
  static Dio? _instance;

  static final BaseOptions _options = BaseOptions(
    baseUrl: BuildConfig.instance.envConfig.baseUrl,
    sendTimeout: const Duration(seconds: 60),
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    contentType: "application/json",
  );

  static Dio get httpDio {
    _instance ??= Dio(_options);
    return _instance!;
  }

  static Dio get dioWithHeaderToken => httpDio;

  NetworkProvider.setContentType(String version) {
    _instance?.options.contentType = "application/json+$version";
  }

  NetworkProvider.setContentTypeApplicationJson() {
    _instance?.options.contentType = "application/json";
  }
}
