import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const String baseUrl = 'http://benhascooters.duckdns.org/api/';
  static const String googleMapsbaseUrl =
      'https://maps.googleapis.com/maps/api/';
  static final String googleApiKey =
      dotenv.env['GOOGLE_API_KEY'] ?? 'No key found';
}
