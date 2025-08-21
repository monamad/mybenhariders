import 'package:flutter/material.dart';
import 'package:mybenhariders/features/check_location_perrmissions/logic/cubit/location_permission_cubit.dart';

class GetIconForLocationType {
  static IconData getIcon(LocationErrorType errorType) {
    switch (errorType) {
      case LocationErrorType.serviceDisabled:
        return Icons.gps_off;
      case LocationErrorType.permissionDenied:
      case LocationErrorType.loading:
        return Icons.hourglass_empty;
      case LocationErrorType.none:
        return Icons.location_on;
    }
  }
}

class GetLocationTypeTitle {
  static String getTitle(LocationErrorType errorType) {
    switch (errorType) {
      case LocationErrorType.serviceDisabled:
        return 'GPS is Disabled';
      case LocationErrorType.permissionDenied:
        return 'Location Permission Required';

      case LocationErrorType.loading:
        return 'Checking Location...';
      case LocationErrorType.none:
        return 'Location Ready';
    }
  }
}
