import 'package:mybenhariders/core/local_data_source/get_location.dart';
import 'package:mybenhariders/core/networking/api_constants.dart';
import 'package:mybenhariders/core/networking/api_result.dart';
import 'package:mybenhariders/core/networking/google_places_service.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/models/location_model.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/models/location_result.dart';

abstract class GetLocationRepo {
  final GetLocation getLocation;
  final GetPlacesInfoService googlePlacesService;
  GetLocationRepo(this.getLocation, this.googlePlacesService);

  Future<ApiResult<LocationModel>> getCurrentLocation();
}

class GetLocationRepoImpl implements GetLocationRepo {
  @override
  final GetLocation getLocation;
  @override
  final GetPlacesInfoService googlePlacesService;

  GetLocationRepoImpl(this.getLocation, this.googlePlacesService);

  @override
  Future<ApiResult<LocationModel>> getCurrentLocation() async {
    try {
      final locationResult = await getLocation.getCurrentLocation();
      return await locationResult.when(
        success: (position) async {
          final geocodeResponse = await googlePlacesService
              .reverseGeocodeRequest(
                '${position.latitude},${position.longitude}',
                ApiConstants.googleApiKey,
                'ar',
              );

          if (geocodeResponse.errorMessage == null) {
            return ApiResult<LocationModel>.success(
              LocationModel(
                latitude: position.latitude.toString(),
                longitude: position.longitude.toString(),
                name: geocodeResponse.results[0].formattedAddress,
              ),
            );
          } else {
            return ApiResult.error(geocodeResponse.errorMessage!);
          }
        },
        error: (state, message) {
          return ApiResult.error(message ?? 'Failed to get location');
        },
      );
    } catch (e) {
      return ApiResult.error('$e');
    }
  }
}
