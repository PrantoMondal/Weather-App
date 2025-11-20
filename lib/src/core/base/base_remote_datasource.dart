import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app/src/core/config/build_config.dart';
import 'package:weather_app/src/core/exceptions/error_handlers.dart';
import 'package:weather_app/src/core/exceptions/exceptions.dart';
import 'package:weather_app/src/core/network/dio_network_provider.dart';
import 'package:weather_app/src/core/network/network_error_handler.dart';

/// A base class for remote data sources that provides safe API calling.
abstract class BaseRemoteDatasource {
  final baseUrl = BuildConfig.instance.envConfig.baseUrl;

  /// Dio client configured with token headers.
  Dio get dioClient => NetworkProvider.dioWithHeaderToken;

  /// Logger from environment config.
  final logger = BuildConfig.instance.envConfig.logger;

  /// Wraps API calls with consistent error handling and response validation.
  Future<Response<T>> callApi<T>(Future<Response<T>> api) async {
    try {
      final response = await api;

      // Log and handle non-200 status codes
      if (response.statusCode != HttpStatus.ok) {
        logger.i(response.toString());
        final data = response.data;
        if (data is Map<String, dynamic> && data.containsKey("message")) {
          logger.i(data["message"]);
        }
      }

      // Handle custom status code inside API response body
      final data = response.data;
      if (data is Map<String, dynamic>) {
        final innerStatus = data['statusCode'];
        if (innerStatus != null && innerStatus != HttpStatus.ok) {
          // TODO: Handle API custom error here
        }
      }

      return response;
    } on DioException catch (dioError) {
      logger.e(
        "API Error >>>>>>>\n"
        "URL: ${dioError.requestOptions.uri}\n"
        "Method: ${dioError.requestOptions.method}\n"
        "Request Data: ${dioError.requestOptions.data}\n"
        "Status: ${dioError.response?.statusCode}\n"
        "Response: ${dioError.response?.data}\n"
        "Message: ${dioError.message}",
      );

      throw handleNetworkError(dioError);
    } catch (error) {
      logger.e("Generic error: >>>>>>> $error");

      if (error is BaseException) rethrow;

      throw handleError(error.toString());
    }
  }
}
