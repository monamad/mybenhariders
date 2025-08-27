import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/logic/cubit/start_trip_cubit.dart';
import 'package:mybenhariders/features/user_features/select_locaton_from_map/logic/map_controller.dart';

/// Confirm button widget
class ConfirmButton extends StatelessWidget {
  final MapController mapController;
  final StartTripCubit startTripCubit;
  final String hint;

  const ConfirmButton({
    super.key,
    required this.mapController,
    required this.startTripCubit,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: BlocProvider.value(
        value: startTripCubit,
        child: BlocBuilder<StartTripCubit, StartTripState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: mapController.isLoading
                  ? null
                  : () => _handleConfirm(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                elevation: 2,
                shadowColor: Theme.of(context).primaryColor.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                _getButtonText(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            );
          },
        ),
      ),
    );
  }

  void _handleConfirm(BuildContext context) {
    if (hint == 'To') {
      startTripCubit.setToLocation(mapController.mapData.value);
    } else {
      startTripCubit.setFromLocation(mapController.mapData.value);
    }
    Navigator.pop(context);
  }

  String _getButtonText() {
    return hint == 'From' ? 'Confirm Pickup Location' : 'Confirm Destination';
  }
}
