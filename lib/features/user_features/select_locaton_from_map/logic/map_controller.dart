import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mybenhariders/features/user_features/select_locaton_from_map/data/google_maps_services.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/models/location_model.dart';

class MapController extends ChangeNotifier {
  final GoogleMapsService _googleMapsService;

  ValueNotifier<LocationModel> mapData = ValueNotifier<LocationModel>(
    LocationModel(name: '', latitude: '', longitude: ''),
  );
  GoogleMapController? _googleMapController;

  Set<Marker> _markers = {};
  bool _isLoading = false;
  String? _error;
  LocationModel? selectedLocation;
  MapController(this._googleMapsService);
  void initLocation(LatLng currantlocation) {
    mapData.value = LocationModel(
      name: mapData.value.name,
      latitude: '${currantlocation.latitude}',
      longitude: '${currantlocation.longitude}',
    );
    _updateMarker();
    _moveCameraToPosition(
      LatLng(
        double.parse(mapData.value.latitude),
        double.parse(mapData.value.longitude),
      ),
    );
  }

  // Getters
  void _changePosition() async {
    _setLoading(true);
    var location = await _googleMapsService.latLngToLocationModel(
      LatLng(
        double.parse(mapData.value.latitude),
        double.parse(mapData.value.longitude),
      ),
    );
    mapData.value = LocationModel(
      name: location.name,
      latitude: mapData.value.latitude,
      longitude: mapData.value.longitude,
    );
    _setLoading(false);
  }

  Set<Marker> get markers => _markers;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
    notifyListeners();
  }

  void onCameraIdle() {
    _changePosition();
  }

  void onCameraMove(CameraPosition position) {
    mapData.value = LocationModel(
      name: mapData.value.name,
      latitude: position.target.latitude.toString(),
      longitude: position.target.longitude.toString(),
    );
  }

  /// Move camera to current location
  Future<void> moveToCurrentLocation(LatLng position) async {
    mapData.value = LocationModel(
      name: mapData.value.name,
      latitude: position.latitude.toString(),
      longitude: position.longitude.toString(),
    );
    _updateMarker();
    await _moveCameraToPosition(position);
  }

  /// Move camera to specific position (private method)
  Future<void> _moveCameraToPosition(LatLng position) async {
    if (_googleMapController != null) {
      await _googleMapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: position, zoom: 15.0),
        ),
      );
    }
  }

  /// Update marker position (private method)
  void _updateMarker() {
    _markers = {
      _googleMapsService.createLocationMarker(
        'selected_location',
        LatLng(
          double.parse(mapData.value.latitude),
          double.parse(mapData.value.longitude),
        ),
      ),
    };
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String? error) {
    _error = error;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }
}
