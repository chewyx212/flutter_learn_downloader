// import 'dart:ffi';
import 'package:flutter_learn_downloader/view/screen/home/home_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_learn_downloader/util/routes.dart';
import 'package:flutter_learn_downloader/view/base/not_found.dart';
import 'package:flutter_learn_downloader/view/screen/onboarding/onboarding_screen.dart';
import 'package:flutter_learn_downloader/view/screen/splash/splash_screen.dart';

class RouterHelper {
  static final FluroRouter router = FluroRouter();

//*******Handlers*********
  static Handler _notFoundHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => NotFound());

  static Handler _splashHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => SplashScreen());

  static Handler _onbordingHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) =>
          OnBoardingScreen());

  static Handler _homeHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => HomeScreen());

//*******Route Define*********
  static void setupRoute() {
    router.notFoundHandler = _notFoundHandler;
    router.define(Routes.SPLASH_SCREEN,
        handler: _splashHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.ONBOARDING_SCREEN,
        handler: _onbordingHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.HOME_SCREEN,
        handler: _homeHandler, transitionType: TransitionType.fadeIn);
  }
}
