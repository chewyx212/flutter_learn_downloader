import 'package:dio/dio.dart';
import 'package:causeways_live/data/repository/splash_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:causeways_live/data/datasource/remote/dio/dio_client.dart';
import 'package:causeways_live/data/datasource/remote/dio/logging_interceptor.dart';
import 'package:causeways_live/data/repository/onboarding_repo.dart';
import 'package:causeways_live/provider/onboarding_provider.dart';
import 'package:causeways_live/provider/splash_provider.dart';
import 'package:causeways_live/provider/theme_provider.dart';
import 'package:causeways_live/util/app_constants.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(),
      loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => OnBoardingRepo(dioClient: sl()));
  sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl()));

  // Provider
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => OnBoardingProvider(onboardingRepo: sl()));
  sl.registerFactory(() => SplashProvider(splashRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
