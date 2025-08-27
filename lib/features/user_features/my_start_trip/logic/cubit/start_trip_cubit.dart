import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mybenhariders/core/local_data_source/get_location.dart';
import 'package:mybenhariders/core/networking/api_result.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/models/auto_complete_request_response.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/models/location_model.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/repos/get_location_repo.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/repos/auto_complete_request_repo.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/repos/place_details_response_repo.dart';

part 'start_trip_state.dart';

part 'start_trip_cubit.freezed.dart';

class StartTripCubit extends Cubit<StartTripState> {
  final PlaceDetailsResponseRepo getPlacesInfoService;
  final GetLocationRepo getLocationRepo;
  final GetLocation getLocation;
  bool isSearching = false;

  final TextEditingController fromLocationController = TextEditingController(
    text: 'current location',
  );

  final TextEditingController toLocationController = TextEditingController();
  final AutoCompleteRequestRepo autoCompleteRequestRepo;

  StartTripCubit(
    this.getLocationRepo,
    this.autoCompleteRequestRepo,
    this.getPlacesInfoService,
    this.getLocation,
  ) : super(StartTripState.initial());

  void initialize() async {
    // Remove local location permission handling
    // The global LocationPermissionCubit will handle all location permissions
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    if (state.currentLocation != null) {
      if (isClosed) return;
      emit(state.copyWith(getingCurrentLocation: true));
      await Future.delayed(Duration(milliseconds: 500));
      setFromLocation(state.currentLocation!);
      emit(state.copyWith(getingCurrentLocation: false));
      return;
    }

    // Fetch current location - permission checking is handled by global cubit
    emit(state.copyWith(getingCurrentLocation: true));

    getLocationRepo.getCurrentLocation().then((result) {
      if (isClosed) return;

      result.when(
        success: (locationModel) {
          if (isClosed) return;
          emit(
            state.copyWith(
              currentLocation: locationModel,
              getingCurrentLocation: false,
            ),
          );
          setFromLocation(locationModel);
        },
        error: (errorMessage) {
          print('Error fetching current location: $errorMessage');
          if (isClosed) return;
          emit(
            state.copyWith(
              getingCurrentLocation: false,
              locationErrorMessage: errorMessage,
            ),
          );
        },
      );
    });
  }

  void setFromLocation(LocationModel location) {
    fromLocationController.text = location.name;
    return emit(
      state.copyWith(
        fromLocation: location,
        controlingfromLocation: false,
        validFromLocationsSelected: true,
      ),
    );
  }

  void setToLocation(LocationModel? location) {
    toLocationController.text = location!.name;
    emit(
      state.copyWith(
        toLocation: location,
        controlingtoLocation: false,
        validToLocationsSelected: true,
      ),
    );
  }

  void removeValidation(String hint) {
    if (hint == 'From') {
      emit(state.copyWith(validFromLocationsSelected: false));
    } else {
      emit(state.copyWith(validToLocationsSelected: false));
    }
  }

  void startSearch(input, isfrom) {
    bool isFromSearching = false;
    isSearching = true;
    if (isfrom == "From") {
      isFromSearching = true;
    } else {
      isFromSearching = false;
    }
    autoCompleteRequestRepo.fetchAutoCompleteSuggestions(input).then((result) {
      if (isClosed) return;

      result.when(
        success: (suggestions) {
          if (isClosed) return;
          emit(
            state.copyWith(
              autoCompleteSuggestions: suggestions.predictions,
              isSearching: true,
              controlingfromLocation: isFromSearching,
              controlingtoLocation: !isFromSearching,
            ),
          );
        },
        error: (errorMessage) {
          print('Error fetching auto-complete suggestions: $errorMessage');
        },
      );
    });
  }

  void getPlaceDetails(String placeId) {
    getPlacesInfoService.getPlaceDetails(placeId).then((result) {
      if (isClosed) return;

      result.when(
        success: (placeDetails) {
          print(state.toString());
          if (isClosed) return;
          if (state.controlingtoLocation) {
            setToLocation(LocationModel.fromplaceDetails(placeDetails));
          } else {
            setFromLocation(LocationModel.fromplaceDetails(placeDetails));
          }
          stopSearch();
        },
        error: (errorMessage) {
          print('Error fetching place details: $errorMessage');
        },
      );
    });
  }

  void stopSearch() {
    isSearching = false;
    emit(state.copyWith(isSearching: isSearching, autoCompleteSuggestions: []));
  }

  @override
  Future<void> close() {
    fromLocationController.dispose();
    toLocationController.dispose();
    return super.close();
  }
}
