// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class GoogleMapsServiceImpl implements GoogleMapsService {
//   @override
//   Future<String> getAddressFromCoordinates(double lat, double lng) async {
//     // Simulate a network call to get address from coordinates
//     await Future.delayed(Duration(seconds: 1));
//     return "Address for $lat, $lng";
//   }

//   @override
//   LatLng locationModelToLatLng(LocationModel location) {
//     return LatLng(1, 2);
//     //LatLng(location.latitude, location.longitude);
//   }

//   @override
//   LocationModel latLngToLocationModel(LatLng latLng, String address) {
//     return LocationModel(
//       id: 'location_${latLng.latitude}_${latLng.longitude}',
//       name: 'Location',
//       fullAddress: address,
//       latitude: latLng.latitude,
//       longitude: latLng.longitude,
//     );
//   }

//   @override
//   Marker createLocationMarker(String markerId, LatLng position) {
//     return Marker(
//       markerId: MarkerId(markerId),
//       position: position,
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//     );
//   }
// }

// abstract class GoogleMapsService {
//   Future<String> getAddressFromCoordinates(double lat, double lng);

//   LocationModel latLngToLocationModel(LatLng latLng, String address);

//   Marker createLocationMarker(String markerId, LatLng position);

//   LatLng locationModelToLatLng(LocationModel location);
// }
