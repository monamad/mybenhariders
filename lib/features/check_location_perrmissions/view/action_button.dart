import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybenhariders/core/themes/colors.dart';
import 'package:mybenhariders/features/check_location_perrmissions/logic/cubit/location_permission_cubit.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/logic/cubit/start_trip_cubit.dart';

class LocationActionButton extends StatelessWidget {
  final LocationPermissionState state;

  const LocationActionButton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LocationPermissionCubit>();

    if (state.errorType == LocationErrorType.loading) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: ColorManager.mainOrage,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            SizedBox(width: 12),
            Text(
              'Please wait...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    String buttonText;
    VoidCallback? onPressed;

    switch (state.errorType) {
      case LocationErrorType.serviceDisabled:
        buttonText = 'Open GPS Settings';
        onPressed = () => cubit.openLocationSettings();
        break;

      case LocationErrorType.permissionDenied:
        buttonText = 'Allow Location Access';
        onPressed = () => cubit.openAppSettings();
        break;

      case LocationErrorType.none:
        buttonText = 'Refresh';
        onPressed = () => context.read<StartTripCubit>().initialize();
        break;

      case LocationErrorType.loading:
        buttonText = 'Loading...';
        onPressed = null;
        break;
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.mainOrage,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          fixedSize: const Size.fromHeight(52),
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,

          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
