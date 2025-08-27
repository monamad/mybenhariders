import 'package:flutter/material.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/logic/cubit/start_trip_cubit.dart';
import 'package:mybenhariders/features/user_features/select_locaton_from_map/logic/map_controller.dart';
import 'package:mybenhariders/features/user_features/select_locaton_from_map/view/widgets/location_display.dart';
import 'package:mybenhariders/features/user_features/select_locaton_from_map/view/widgets/confirm_button.dart';

/// Location information card with confirm button
class LocationInfoCard extends StatelessWidget {
  final MapController mapController;
  final StartTripCubit startTripCubit;
  final String hint;

  const LocationInfoCard({
    super.key,
    required this.mapController,
    required this.startTripCubit,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 24,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.grey.shade50],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(
                    Icons.add,
                    size: 32,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 12),
                LocationDisplay(mapController: mapController),
                SizedBox(height: 16),
                ConfirmButton(
                  mapController: mapController,
                  startTripCubit: startTripCubit,
                  hint: hint,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
