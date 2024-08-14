import 'package:flutter_ex/core/Cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
}
