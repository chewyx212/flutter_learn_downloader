import 'dart:async';
import 'dart:io';
import 'package:flutter_learn_downloader/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_learn_downloader/util/color_resources.dart';
import 'package:flutter_learn_downloader/util/images.dart';
import 'package:flutter_learn_downloader/util/routes.dart';
import 'package:flutter_learn_downloader/provider/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey();
  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;
  bool NoConnection = false;

  @override
  void initState() {
    super.initState();
    bool _firstTime = true;

    _onConnectivityChanged = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (_firstTime) {
        bool isNotConnected = result != ConnectivityResult.wifi &&
            result != ConnectivityResult.mobile;
        print(isNotConnected);
        if (!isNotConnected) {
          _route();
        }
        _firstTime = false;
      }
    });
    checkConnection();
  }

  @override
  void dispose() {
    super.dispose();

    _onConnectivityChanged.cancel();
  }

  void _route() {
    Provider.of<SplashProvider>(context, listen: false)
        .initConfig(_globalKey)
        .then((bool success) {
      if (success) {
        return Navigator.pushNamedAndRemoveUntil(
            context, Routes.getOnBoardingRoute(), (route) => false);
      }
    });
  }

  void checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    this.NoConnection = connectivityResult == ConnectivityResult.none;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Images.splash),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      ColorResources.COLOR_BLACK.withOpacity(.4),
                      BlendMode.darken)),
            ),
          ),
          Positioned.fill(
            child: Align(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 280,
                      image: AssetImage(Images.top_title),
                    ),
                    NoConnection
                        ? Column(
                            children: [
                              Text(
                                'No Internet Connection Found',
                                style: robotoRegular.copyWith(
                                    color: ColorResources.COLOR_RED,
                                    fontSize: 18),
                              ),
                              Text(
                                'Please check your connection and\n restart the application.',
                                textAlign: TextAlign.center,
                                style: robotoRegular.copyWith(
                                    color: ColorResources.COLOR_RED,
                                    fontSize: 14),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
