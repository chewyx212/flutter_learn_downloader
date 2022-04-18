import 'package:flutter/material.dart';
import 'package:flutter_learn_downloader/data/repository/splash_repo.dart';

class SplashProvider extends ChangeNotifier {
  final SplashRepo splashRepo;

  SplashProvider({required this.splashRepo});
  Future<bool> initConfig(GlobalKey<ScaffoldMessengerState> globalKey) async {
    return true;
  }

  Future<bool> removeSharedData() {
    return splashRepo.removeSharedData();
  }
}
