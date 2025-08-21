import 'package:get_it/get_it.dart';
import 'package:mybenhariders/core/di/modules/network_module.dart';
import 'package:mybenhariders/core/di/modules/auth_module.dart';
import 'package:mybenhariders/core/di/modules/ui_module.dart';
import 'package:mybenhariders/core/di/modules/location_module.dart';

GetIt getIt = GetIt.instance;

/// Main DI setup - orchestrates all modules
Future<void> setupGetIt() async {
  NetworkModule.register(getIt);
  AuthModule.register(getIt);
  UIModule.register(getIt);
  LocationModule.register(getIt);

  // Future modules:
  // StorageModule.register(getIt);
  // DatabaseModule.register(getIt);
  // NotificationModule.register(getIt);
}
