import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/core/base/base_controller.dart';
import 'package:weather_app/src/core/base/page_state.dart';
import 'package:weather_app/src/core/config/build_config.dart';
import 'package:weather_app/src/core/constants/app_colors.dart';

abstract class BaseView<Controller extends BaseController> extends GetView<Controller> {
  BaseView({super.key});

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  final logger = BuildConfig.instance.envConfig.logger;

  Widget body(BuildContext context);
  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          annotatedRegion(context),
          Obx(
            () => controller.pageState == PageState.LOADING
                ? _showLoading()
                : const SizedBox(),
          ),
          Obx(
            () => controller.errorMessage.isNotEmpty
                ? showErrorSnackBar(controller.errorMessage)
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor(),
        statusBarIconBrightness: Brightness.light,
      ),
      child: Material(color: Colors.transparent, child: pageScaffold(context)),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackgroundColor(),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButtonLocation: floatingActionButtonLocation(),
      floatingActionButton: floatingActionButton(),
      body: body(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
    );
  }

  /// Error Snackbar shown automatically when `controller.errorMessage` is set
  Widget showErrorSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: AppColors.red,
      behavior: SnackBarBehavior.floating,
    );

    return Builder(
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          controller.showErrorMessage(""); // clear error
        });
        return const SizedBox();
      },
    );
  }

  /// Generic success/info message you can call anywhere inside the page
  void showMessage(String message, {Color color = AppColors.black}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
    );

    final currentContext = globalKey.currentContext;
    if (currentContext != null) {
      ScaffoldMessenger.of(currentContext).showSnackBar(snackBar);
    }
  }

  // Default overridable configs

  Color pageBackgroundColor() => AppColors.black;

  Color statusBarColor() => AppColors.black;

  Widget? floatingActionButton() => null;

  Widget? bottomNavigationBar() => null;

  Widget? drawer() => null;

  Widget _showLoading() =>
      const Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2));

  FloatingActionButtonLocation? floatingActionButtonLocation() => null;

  bool resizeToAvoidBottomInset() => true;
}
