part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
}

abstract class _Paths {
  static const SPLASH = "/splash";
  static const HOME = "/";
}
