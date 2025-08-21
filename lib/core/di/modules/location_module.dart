import 'package:get_it/get_it.dart';
import 'package:mybenhariders/core/local_data_source/get_location.dart';
import 'package:mybenhariders/core/networking/google_places_service.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/repos/auto_complete_request_repo.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/repos/get_location_repo.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/repos/place_details_response_repo.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/logic/cubit/start_trip_cubit.dart';
// import 'package:mybenhariders/core/local_data_source/location_data_source_impl.dart';
// import 'package:mybenhariders/core/networking/google_maps_services.dart';
// import 'package:mybenhariders/core/networking/google_places_http_service.dart';
// import 'package:mybenhariders/features/user_features/start_trip/data/repositories/google_places_parser_repository.dart';
// import 'package:mybenhariders/features/user_features/start_trip/logic/cubit/start_trip_cubit.dart';
// import 'package:mybenhariders/features/user_features/start_trip/data/repositories/location_repository.dart';
// import 'package:mybenhariders/features/user_features/start_trip/data/repositories/location_repository_impl.dart';
// import 'package:mybenhariders/core/local_data_source/location_datasource.dart';
// import 'package:mybenhariders/core/local_data_source/google_places_datasource.dart';

// import 'package:mybenhariders/features/user_features/start_trip/logic/map_controller.dart';

/// DI module for location-related services and dependencies
class LocationModule {
  static void register(GetIt getIt) {
    // location dependencies
    getIt.registerLazySingleton<GetPlacesInfoService>(
      () => GetPlacesInfoService(getIt()),
    );
    getIt.registerLazySingleton<GetLocation>(() => GetLocationImpl());

    getIt.registerLazySingleton<GetLocationRepo>(
      () => GetLocationRepoImpl(
        getIt<GetLocation>(),
        getIt<GetPlacesInfoService>(),
      ),
    );
    getIt.registerLazySingleton<AutoCompleteRequestRepo>(
      () => AutoCompleteRequestRepo(getIt<GetPlacesInfoService>()),
    );
    getIt.registerLazySingleton<PlaceDetailsResponseRepo>(
      () => PlaceDetailsResponseRepo(getIt<GetPlacesInfoService>()),
    );
    getIt.registerFactory<StartTripCubit>(
      () => StartTripCubit(
        getIt<GetLocationRepo>(),
        getIt<AutoCompleteRequestRepo>(),
        getIt<PlaceDetailsResponseRepo>(),
        getIt<GetLocation>(),
      ),
    );

    // HTTP Services (Dio is already registered in NetworkModule)
    // getIt.registerLazySingleton<GooglePlacesHttpService>(
    //   () => GooglePlacesHttpService(dio: getIt()),
    // );

    // // Parsers
    // getIt.registerLazySingleton<GooglePlacesParserRepository>(
    //   () => GooglePlacesParserRepository(),
    // );

    // // Services
    // getIt.registerLazySingleton<GoogleMapsService>(
    //   () => GoogleMapsServiceImpl(),
    // );

    // // Data Sources
    // getIt.registerLazySingleton<LocationDataSource>(
    //   () => LocationDataSourceImpl(),
    // );

    // getIt.registerLazySingleton<GooglePlacesDataSource>(
    //   () => GooglePlacesDataSourceImpl(httpService: getIt(), parser: getIt()),
    // );

    // // Repositories
    // getIt.registerLazySingleton<LocationRepository>(
    //   () => LocationRepositoryImpl(
    //     googlePlacesDataSource: getIt(),
    //     locationDataSource: getIt(),
    //   ),
    // );

    // // Controllers (Factory - new instance each time)
    // getIt.registerFactory<MapController>(() => MapController(getIt()));

    // //Cubits (Factory - new instance each time)
    // getIt.registerFactory<StartTripCubit>(() => StartTripCubit(getIt()));
  }
}
