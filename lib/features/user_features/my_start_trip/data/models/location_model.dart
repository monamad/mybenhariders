import 'package:mybenhariders/features/user_features/my_start_trip/data/models/place_details_response.dart';

class LocationModel {
  final String name;
  final String latitude;
  final String longitude;

  LocationModel({
    required this.latitude,
    required this.longitude,
    required this.name,
  });

  factory LocationModel.fromplaceDetails(PlaceDetailsResponse placeDetails) =>
      LocationModel(
        name: placeDetails.result.name,
        latitude: placeDetails.result.geometry.location.lat.toString(),
        longitude: placeDetails.result.geometry.location.lng.toString(),
      );
}
