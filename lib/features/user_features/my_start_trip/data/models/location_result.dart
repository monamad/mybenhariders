import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
part 'location_result.freezed.dart';

enum LocationStatus { granted, denied, deniedForever, serviceDisabled, unknown }

@freezed
class LocationResult with _$LocationResult {
  const factory LocationResult.success({required Position position}) =
      LocationSuccess;

  const factory LocationResult.error({
    required LocationStatus status,
    String? errorMessage,
  }) = LocationError;
}
