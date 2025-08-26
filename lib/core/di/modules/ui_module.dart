import 'package:get_it/get_it.dart';
import 'package:mybenhariders/core/networking/google_places_service.dart';
import 'package:mybenhariders/features/user_features/main_layout/logic/main_layout_controller.dart';
import 'package:mybenhariders/features/user_features/select_locaton_from_map/data/google_maps_services.dart';
import 'package:mybenhariders/features/user_features/select_locaton_from_map/logic/map_controller.dart';

/// DI module for UI controllers and feature-specific dependencies
class UIModule {
  static void register(GetIt getIt) {
    // Main Layout Controller (Singleton - persists across navigation)
    getIt.registerLazySingleton<MainLayoutController>(() {
      final controller = MainLayoutController();
      controller.initialize();
      return controller;
    });
    getIt.registerFactory<GoogleMapsService>(
      () => GoogleMapsServiceImpl(
        googlePlacesService: getIt<GetPlacesInfoService>(),
      ),
    );
    getIt.registerFactory<MapController>(
      () => MapController(getIt<GoogleMapsService>()),
    );
    // Future controllers can be added here:
    // getIt.registerFactory<HomeController>(() => HomeController());
    // getIt.registerFactory<ProfileController>(() => ProfileController());
  }
}
