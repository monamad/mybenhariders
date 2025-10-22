import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/logic/cubit/start_trip_cubit.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/view/widgets/current_location_button.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/view/widgets/select_locations_card.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/view/widgets/start_trip_button.dart';
import 'package:mybenhariders/features/check_location_perrmissions/logic/cubit/location_permission_cubit.dart';

class MyStartTripView extends StatelessWidget {
  const MyStartTripView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Start Your Trip'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      body: BlocBuilder<StartTripCubit, StartTripState>(
        builder: (context, startTripState) {
          // The global overlay will handle all location permission errors
          // So we can just show the trip content
          return _buildTripContent(context);
        },
      ),
    );
  }

  Widget _buildTripContent(BuildContext context) {
    final startTripState = context.watch<StartTripCubit>().state;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectLocationsCard(),
          const SizedBox(height: 20),
          if (startTripState.validFromLocationsSelected &&
              startTripState.validToLocationsSelected)
            const StartTripButton(),
          const SizedBox(height: 10),
          CurrentLocationButton(
            onPressed: () {
              // Trigger location permission check before getting current location
              context.read<LocationPermissionCubit>().checkLocationStatus();
              context.read<StartTripCubit>().getCurrentLocation();
            },
            isLoading: startTripState.getingCurrentLocation,
          ),
        ],
      ),
    );
  }
}
