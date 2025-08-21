import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mybenhariders/core/networking/api_service.dart';
import 'package:mybenhariders/core/networking/dio_factory.dart';
import 'package:mybenhariders/core/networking/google_signin_service.dart';

/// DI module for network-related dependencies
class NetworkModule {
  static void register(GetIt getIt) {
    // Dio instance
    getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

    // API Service
    getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

    // Google Sign In
    getIt.registerLazySingleton<GoogleSignIn>(
      () => GoogleSignIn(
        serverClientId:
            '726648538508-tr05ii44g5af872nhq922sarmufii55i.apps.googleusercontent.com',
        scopes: ['email', 'profile', 'openid'],
      ),
    );

    // Google Sign In Service
    getIt.registerLazySingleton<GoogleSignInService>(
      () => GoogleSignInService(getIt<GoogleSignIn>()),
    );
  }
}
