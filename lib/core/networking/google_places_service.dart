import 'package:dio/dio.dart';
import 'package:mybenhariders/core/networking/api_constants.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/models/auto_complete_request_response.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/models/geocode_response.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/models/place_details_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'google_places_service.g.dart';

@RestApi(baseUrl: ApiConstants.googleMapsbaseUrl)
abstract class GetPlacesInfoService {
  factory GetPlacesInfoService(Dio dio) = _GetPlacesInfoService;

  @GET('geocode/json')
  Future<GeocodeResponse> reverseGeocodeRequest(
    @Query('latlng') String latLng,
    @Query('key') String apiKey,
    @Query('language') String language,
  );

  @GET('place/autocomplete/json')
  Future<SearchAutoCompleteResponse> autoCompleteRequest(
    @Query('input') String input,
    @Query('key') String apiKey,
    @Query('language') String language,
    @Query('location') String location,
    @Query('components') String components,
    @Query('radius') int radius,
    @Query('types') String types,
  );

  @GET('place/details/json')
  Future<PlaceDetailsResponse> placeDetailsRequest(
    @Query('place_id') String placeId,
    @Query('key') String apiKey,
    @Query('language') String language,
    @Query('fields') String fields,
  );
}
