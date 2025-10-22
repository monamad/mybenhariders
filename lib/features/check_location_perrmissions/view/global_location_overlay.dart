import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybenhariders/features/check_location_perrmissions/logic/cubit/location_permission_cubit.dart';
import 'package:mybenhariders/features/check_location_perrmissions/view/location_permission_error_view.dart';

class GlobalLocationOverlay extends StatelessWidget {
  final Widget child;

  const GlobalLocationOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationPermissionCubit, LocationPermissionState>(
      builder: (context, state) {
        // Show overlay when location service is disabled OR permission is denied
        if (state.errorType == LocationErrorType.serviceDisabled ||
            state.errorType == LocationErrorType.permissionDenied) {
          return Scaffold(body: LocationPermissionErrorView());
        }

        // Show normal content
        return child;
      },
    );
  }
}
