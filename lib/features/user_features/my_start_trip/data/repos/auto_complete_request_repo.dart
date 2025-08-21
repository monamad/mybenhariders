import 'package:mybenhariders/core/networking/api_constants.dart';
import 'package:mybenhariders/core/networking/api_result.dart';
import 'package:mybenhariders/core/networking/google_places_service.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/models/auto_complete_request_response.dart';

class AutoCompleteRequestRepo {
  final GetPlacesInfoService getPlacesInfoService;

  AutoCompleteRequestRepo(this.getPlacesInfoService);

  Future<ApiResult<SearchAutoCompleteResponse>> fetchAutoCompleteSuggestions(
    String input,
  ) async {
    try {
      final response = await getPlacesInfoService.autoCompleteRequest(
        input,
        ApiConstants.googleApiKey,
        'ar',
        '30.4666,31.1836', // Cairo, Egypt location
        'country:eg',
        40000,
        'establishment',
      );
      if (response.status == "OK") {
        return ApiResult<SearchAutoCompleteResponse>.success(response);
      } else {
        return ApiResult.error(
          'Error fetching auto-complete suggestions: ${response.errorMessage}',
        );
      }
    } catch (e) {
      throw Exception('Failed to fetch auto-complete suggestions: $e');
    }
  }
}
