import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mybenhariders/core/networking/api_key.dart' as ApiConstants;
import 'package:mybenhariders/core/networking/google_places_service.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/models/location_model.dart';

class GoogleMapsServiceImpl implements GoogleMapsService {
  @override
  final GetPlacesInfoService googlePlacesService;

  GoogleMapsServiceImpl({required this.googlePlacesService});

  @override
  Future<String> getAddressFromCoordinates(double lat, double lng) async {
    // Simulate a network call to get address from coordinates
    await Future.delayed(Duration(seconds: 1));
    return "Address for $lat, $lng";
  }

  @override
  LatLng locationModelToLatLng(LocationModel location) {
    return LatLng(1, 2);
    //LatLng(location.latitude, location.longitude);
  }

  @override
  Future<LocationModel> latLngToLocationModel(LatLng position) async {
    final geocodeResponse = await googlePlacesService.reverseGeocodeRequest(
      '${position.latitude},${position.longitude}',
      ApiConstants.googleApiKey,
      'ar',
    );
    return LocationModel(
      latitude: position.latitude.toString(),
      longitude: position.longitude.toString(),
      name: geocodeResponse.results[0].formattedAddress,
    );
  }

  @override
  Marker createLocationMarker(String markerId, LatLng position) {
    return Marker(
      markerId: MarkerId(markerId),
      position: position,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
  }
}

abstract class GoogleMapsService {
  final GetPlacesInfoService googlePlacesService;
  GoogleMapsService(this.googlePlacesService);
  Future<String> getAddressFromCoordinates(double lat, double lng);

  Future<LocationModel> latLngToLocationModel(LatLng latLng);

  Marker createLocationMarker(String markerId, LatLng position);

  LatLng locationModelToLatLng(LocationModel location);
}
