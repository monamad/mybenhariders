import 'package:geolocator/geolocator.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/models/location_result.dart';

abstract class GetLocation {
  Future<LocationResult> getCurrentLocation();
  Future<bool> isLocationServiceEnabled();
  Stream<ServiceStatus> getServiceStatusStream();
  LocationSettings configureAndroidsettings();
  Future<LocationPermission> checkPermission();
  Future<LocationPermission> requestPermission();
  Future<bool> openAppSettings();
  Future<LocationStatus> getLocationStatus();
}

class GetLocationImpl implements GetLocation {
  @override
  Stream<ServiceStatus> getServiceStatusStream() {
    return Geolocator.getServiceStatusStream();
  }

  @override
  Future<LocationPermission> checkPermission() async {
    return await Geolocator.checkPermission();
  }

  @override
  Future<LocationPermission> requestPermission() async {
    return await Geolocator.requestPermission();
  }

  @override
  Future<LocationStatus> getLocationStatus() async {
    // Check if location service is enabled
    if (!await isLocationServiceEnabled()) {
      return LocationStatus.serviceDisabled;
    }

    // Check permission status
    final permission = await checkPermission();
    switch (permission) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return LocationStatus.granted;
      case LocationPermission.denied:
        return LocationStatus.denied;
      case LocationPermission.deniedForever:
        return LocationStatus.deniedForever;
      default:
        return LocationStatus.unknown;
    }
  }

  @override
  Future<LocationResult> getCurrentLocation() async {
    // Check location service
    if (!await isLocationServiceEnabled()) {
      return LocationResult.error(
        status: LocationStatus.serviceDisabled,
        errorMessage:
            'Location services are disabled. Please enable location services.',
      );
    }

    // Check and handle permissions
    LocationPermission permission = await checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await requestPermission();
      if (permission == LocationPermission.denied) {
        return LocationResult.error(
          status: LocationStatus.denied,
          errorMessage:
              'Location permission is denied. Please allow location access.',
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return LocationResult.error(
        status: LocationStatus.deniedForever,
        errorMessage:
            'Location permission is permanently denied. Please enable it from app settings.',
      );
    }

    // Get position
    final Position position = await Geolocator.getCurrentPosition(
      locationSettings: configureAndroidsettings(),
    );

    return LocationResult.success(position: position);
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  @override
  LocationSettings configureAndroidsettings() {
    return AndroidSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
      forceLocationManager: false,
      intervalDuration: const Duration(seconds: 5),
      //(Optional) Set foreground notification config to keep the app alive
      //when going to the background
      foregroundNotificationConfig: const ForegroundNotificationConfig(
        notificationText:
            'Ben Ha Riders is using your location to provide better service',
        notificationTitle: 'Location Service Active',
        enableWakeLock: true,
      ),
    );
  }

  @override
  Future<bool> openAppSettings() async {
    return await Geolocator.openAppSettings();
  }
}
