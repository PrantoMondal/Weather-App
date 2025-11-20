import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/core/config/build_config.dart';
import 'package:weather_app/src/core/constants/app_colors.dart';
import 'package:weather_app/src/core/exceptions/exceptions.dart';

import 'page_state.dart';

abstract class BaseController extends GetxController {
  final logger = BuildConfig.instance.envConfig.logger;

  final logoutController = false.obs;

  //Reload the page
  final _refreshController = false.obs;

  refreshPage(bool refresh) => _refreshController(refresh);

  //Controls page state
  final _pageSateController = PageState.DEFAULT.obs;

  PageState get pageState => _pageSateController.value;

  updatePageState(PageState state) => _pageSateController(state);

  resetPageState() => _pageSateController(PageState.DEFAULT);

  showLoading() => updatePageState(PageState.LOADING);

  hideLoading() => resetPageState();

  final _messageController = ''.obs;

  String get message => _messageController.value;

  showMessage(String msg) => _messageController(msg);

  final _errorMessageController = ''.obs;

  String get errorMessage => _errorMessageController.value;

  showErrorMessage(String msg) {
    _errorMessageController(msg);
  }

  final _successMessageController = ''.obs;

  String get successMessage => _successMessageController.value;

  showSuccessMessage(String msg) => _successMessageController(msg);

  // ignore: long-parameter-list
  dynamic callDataService<T>(
    Future<T> future, {
    Function(Exception exception)? onError,
    Function(T response)? onSuccess,
    Function()? onComplete,
    bool showLoadingStatus = true,
    bool showError = true,
  }) async {
    BaseException? _exception;

    if (showLoadingStatus) showLoading();

    try {
      final T response = await future;

      if (onComplete != null) onComplete();

      if (onSuccess != null) onSuccess(response);

      if (successMessage.isNotEmpty) showSuccessToast(successMessage);

      hideLoading();

      return response;
    } on ServiceUnavailableException catch (exception) {
      _exception = exception;
      if (showError) {
        showErrorMessage(exception.message);
      }
    } on UnauthorizedException catch (exception) {
      _exception = exception;
      if (showError) {
        showErrorMessage(exception.message);
      }
    } on TimeoutException catch (exception) {
      _exception = exception;
      if (showError) {
        showErrorMessage(exception.message ?? 'Timeout exception');
      }
    } on NetworkException catch (exception) {
      _exception = exception;
      if (showError) {
        showErrorMessage(exception.message);
      }
    } on JsonFormatException catch (exception) {
      _exception = exception;
      if (showError) {
        showErrorMessage(exception.message);
      }
    } on NotFoundException catch (exception) {
      _exception = exception;
      if (showError) {
        showErrorMessage(exception.message);
      }
    } on ApiException catch (exception) {
      _exception = exception;
      if (showError) {
        showErrorMessage(exception.message);
      }
    } on ApplicationException catch (exception) {
      _exception = exception;
      if (showError) {
        showErrorMessage(exception.message);
      }
    } catch (error, trace) {
      logger.e("Controller>>>>>> error $error");
      logger.e("Controller>>>>>> error $trace");

      if (error is BaseException) {
        _exception = error;
        if (showError) showErrorMessage(error.message);
      } else {
        _exception = ApplicationException(message: "$error");
        if (showError) showErrorMessage('appLocalization.unknownError');
      }
    }

    if (onError != null) onError(_exception);

    hideLoading();
  }

  void showSuccessToast(String message) {
    if (_successMessageController.value.isNotEmpty) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.green,
          margin: const EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
    showSuccessMessage("");
  }

  @override
  void onClose() {
    _messageController.close();
    _refreshController.close();
    _pageSateController.close();
    super.onClose();
  }
}
