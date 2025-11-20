import 'package:logger/logger.dart';

class EnvConfig {
  final String appName;
  final String appVersion;
  final String packageName;
  final String baseUrl;
  final bool shouldCollectCrashLog;

  late final Logger logger;

  EnvConfig({
    required this.appName,
    required this.appVersion,
    required this.packageName,
    required this.baseUrl,
    this.shouldCollectCrashLog = false,
  }) {
    logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printTime: true,
      ),
    );
  }
}
