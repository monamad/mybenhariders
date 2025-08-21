import 'api_key.dart' as api_key;

class ApiConstants {
  static const String baseUrl = 'http://13.60.93.146/api/';
  static const String googleMapsbaseUrl =
      'https://maps.googleapis.com/maps/api/';
  // Expose the API key from the imported file
  static const String googleApiKey = api_key.googleApiKey;
}
