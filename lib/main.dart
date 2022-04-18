import 'dart:io';

import 'package:flutter_learn_downloader/view/screen/splash/splash_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_learn_downloader/helper/responsive_helper.dart';
import 'package:flutter_learn_downloader/helper/router_helper.dart';
import 'package:flutter_learn_downloader/provider/onboarding_provider.dart';
import 'package:flutter_learn_downloader/provider/splash_provider.dart';
import 'package:flutter_learn_downloader/provider/theme_provider.dart';
import 'package:flutter_learn_downloader/theme/dark_theme.dart';
import 'package:flutter_learn_downloader/theme/light_theme.dart';
import 'package:flutter_learn_downloader/util/app_constants.dart';
import 'package:flutter_learn_downloader/util/routes.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'di_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  if (ResponsiveHelper.isMobilePhone()) {
    HttpOverrides.global = new MyHttpOverrides();
  }
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<OnBoardingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
    ],
    child: MyApp(
      isWeb: !kIsWeb,
    ),
  ));
}

class MyApp extends StatefulWidget {
  final bool? isWeb;

  const MyApp({Key? key, this.isWeb}) : super(key: key);

  static final navigatorKey = new GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    RouterHelper.setupRoute();

    if (kIsWeb) {
      print('using web');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, splashProvider, child) {
        return MaterialApp(
          initialRoute:
              kIsWeb ? Routes.getOnBoardingRoute() : Routes.getSplashRoute(),
          onGenerateRoute: RouterHelper.router.generator,
          title: AppConstants.APP_NAME,
          debugShowCheckedModeBanner: false,
          navigatorKey: MyApp.navigatorKey,
          theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
          scrollBehavior: MaterialScrollBehavior().copyWith(dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown,
          }),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
