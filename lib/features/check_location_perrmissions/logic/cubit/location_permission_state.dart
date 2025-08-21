part of 'location_permission_cubit.dart';

enum LocationErrorType { none, serviceDisabled, permissionDenied, loading }

@freezed
abstract class LocationPermissionState with _$LocationPermissionState {
  const factory LocationPermissionState({
    @Default(LocationErrorType.loading) LocationErrorType errorType,
    @Default('') String errorMessage,
  }) = _Initial;
}
