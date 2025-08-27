import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mybenhariders/features/user_features/select_locaton_from_map/logic/map_controller.dart';

/// Reusable Google Maps widget with single responsibility
class GoogleMapsWidget extends StatelessWidget {
  final MapController mapController;
  final LatLng initialPosition;
  final double zoom;
  final VoidCallback? onTap;

  const GoogleMapsWidget({
    super.key,
    required this.mapController,
    required this.initialPosition,
    this.zoom = 15.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onCameraIdle: mapController.onCameraIdle,
      onMapCreated: mapController.onMapCreated,
      onCameraMove: mapController.onCameraMove,
      onTap: onTap != null ? (_) => onTap!() : null,
      initialCameraPosition: CameraPosition(
        target: initialPosition,
        zoom: zoom,
      ),
      markers: mapController.markers,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      mapToolbarEnabled: false,
      compassEnabled: true,
      trafficEnabled: false,
      buildingsEnabled: true,
      indoorViewEnabled: true,
      mapType: MapType.normal,
      style: _getMapStyle(),
    );
  }

  /// Custom map style (optional)
  String? _getMapStyle() {
    // You can return a custom map style JSON here
    // For now, return null to use default style
    return null;
  }
}
