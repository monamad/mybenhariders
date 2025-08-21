part of 'start_trip_cubit.dart';

@freezed
abstract class StartTripState with _$StartTripState {
  const factory StartTripState.initial({
    @Default(null) LocationModel? currentLocation,
    @Default(null) LocationModel? fromLocation,
    @Default(false) bool getingCurrentLocation,
    @Default(null) LocationModel? toLocation,
    @Default(true) bool controlingfromLocation,
    @Default(true) bool controlingtoLocation,
    @Default(false) bool isSearching,
    @Default([]) List<Predictions> autoCompleteSuggestions,
    @Default(false) bool validFromLocationsSelected,
    @Default(false) bool validToLocationsSelected,
    @Default(true) bool canAccessLocation,
    @Default('') String locationErrorMessage,
  }) = _Initial;
}
