import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mybenhariders/core/local_data_source/get_location.dart';

part 'location_permission_state.dart';
part 'location_permission_cubit.freezed.dart';

class LocationPermissionCubit extends Cubit<LocationPermissionState> {
  final GetLocation getLocation;
  Timer? _permissionCheckTimer;

  LocationPermissionCubit(this.getLocation)
    : super(const LocationPermissionState());

  @override
  Future<void> close() {
    _permissionCheckTimer?.cancel();
    return super.close();
  }

  void initialize() async {
    startServiceStatusListener();
    await checkServiceStatus();
    checkLocationStatus();
  }

  Future<void> checkServiceStatus() async {
    bool isLocationServiceEnabled = await getLocation
        .isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      emit(
        state.copyWith(
          errorType: LocationErrorType.serviceDisabled,
          errorMessage: 'Location services are disabled. Please enable GPS.',
        ),
      );
    }
  }

  void startServiceStatusListener() async {
    getLocation.getServiceStatusStream().listen((status) {
      if (status == ServiceStatus.disabled) {
        emit(
          state.copyWith(
            errorType: LocationErrorType.serviceDisabled,
            errorMessage: 'Location services are disabled. Please enable GPS.',
          ),
        );
      } else if (status == ServiceStatus.enabled) {
        emit(state.copyWith(errorType: LocationErrorType.loading));
        checkLocationStatus();
      }
    });
  }

  void checkLocationStatus() async {
    if (isClosed) return;
    if (state.errorType == LocationErrorType.serviceDisabled) return;
    emit(state.copyWith(errorType: LocationErrorType.loading));
    try {
      final permission = await getLocation.checkPermission();
      // Fix the logic: use AND instead of OR
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        final newPermission = await getLocation.requestPermission();
        if (newPermission == LocationPermission.denied ||
            newPermission == LocationPermission.deniedForever) {
          emit(
            state.copyWith(
              errorType: LocationErrorType.permissionDenied,
              errorMessage: 'Location permission denied. Enable in settings.',
            ),
          );
        } else {
          emit(
            state.copyWith(errorType: LocationErrorType.none, errorMessage: ''),
          );
        }
      } else {
        emit(
          state.copyWith(errorType: LocationErrorType.none, errorMessage: ''),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          errorType: LocationErrorType.permissionDenied,
          errorMessage: 'Failed to check location status: ${e.toString()}',
        ),
      );
    }
  }

  void setErrorMessage(String message) {
    emit(state.copyWith(errorMessage: message));
  }

  Future<void> requestPermission() async {
    emit(state.copyWith(errorType: LocationErrorType.loading));

    await getLocation.requestPermission();
    checkLocationStatus();
  }

  void openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  void openAppSettings() async {
    await getLocation.openAppSettings();
    //Temporary solution need real solution
    _startPermissionCheckTimer();
  }

  void _startPermissionCheckTimer() {
    _permissionCheckTimer?.cancel();
    _permissionCheckTimer = Timer.periodic(const Duration(seconds: 2), (
      timer,
    ) async {
      final permission = await getLocation.checkPermission();

      if (permission != LocationPermission.denied) {
        timer.cancel();
        checkLocationStatus();
      }
    });

    Timer(const Duration(seconds: 30), () {
      _permissionCheckTimer?.cancel();
    });
  }
}
