import 'package:mybenhariders/core/networking/api_constants.dart';
import 'package:mybenhariders/core/networking/api_result.dart';
import 'package:mybenhariders/core/networking/google_places_service.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/models/place_details_response.dart';

class PlaceDetailsResponseRepo {
  final GetPlacesInfoService googlePlacesService;

  PlaceDetailsResponseRepo(this.googlePlacesService);
  Future<ApiResult<PlaceDetailsResponse>> getPlaceDetails(
    String placeId,
  ) async {
    try {
      final response = await googlePlacesService.placeDetailsRequest(
        placeId,
        ApiConstants.googleApiKey,
        'ar',
        'place_id,name,formatted_address,geometry,types,address_components',
      );

      if (response.status == 'OK') {
        return ApiResult<PlaceDetailsResponse>.success(response);
      } else {
        return ApiResult.error(
          'Error fetching place details: ${response.status}',
        );
      }
    } catch (e) {
      return ApiResult.error('Failed to get place details: $e');
    }
  }
}
