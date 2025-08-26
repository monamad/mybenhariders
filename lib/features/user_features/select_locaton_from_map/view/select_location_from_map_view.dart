import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/models/location_model.dart';

import 'package:mybenhariders/features/user_features/my_start_trip/logic/cubit/start_trip_cubit.dart';
import 'package:mybenhariders/features/user_features/select_locaton_from_map/logic/map_controller.dart';
import 'package:mybenhariders/features/user_features/select_locaton_from_map/view/google_maps_widget.dart';

class SelectLocationFromMapView extends StatefulWidget {
  const SelectLocationFromMapView({super.key});

  @override
  State<SelectLocationFromMapView> createState() =>
      _SelectLocationFromMapViewState();
}

class _SelectLocationFromMapViewState extends State<SelectLocationFromMapView> {
  final MapController _mapController = GetIt.instance.get<MapController>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final LatLng initialPosition = LatLng(
      double.parse(args['initialPosition'].latitude),
      double.parse(args['initialPosition'].longitude),
    );
    final String hint = args['hint'];
    final StartTripCubit startTripCubit = args['startTripCubit'];
    _mapController.initLocation(initialPosition);
    return ValueListenableBuilder<LocationModel>(
      valueListenable: _mapController.mapData,
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Select Location'),
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            actions: [
              TextButton(
                onPressed: null,
                child: Text(
                  'Done',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,

                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              GoogleMapsWidget(
                mapController: _mapController,
                initialPosition: initialPosition,
                zoom: 15.0,
              ),

              // Center crosshair
              Center(
                child: Icon(
                  Icons.add,
                  size: 32,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              // Location info card with confirm button
              Positioned(
                left: 16,
                right: 16,
                bottom: 24,
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
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
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Theme.of(
                                    context,
                                  ).primaryColor.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.location_on,
                                  color: Theme.of(context).primaryColor,
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Selected Location',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: _mapController.isLoading
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                Theme.of(context).primaryColor,
                                              ),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        'Loading location...',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )
                                : Text(
                                    _mapController.mapData.value.name.isEmpty
                                        ? 'Select a location on the map'
                                        : _mapController.mapData.value.name,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: BlocProvider.value(
                              value: startTripCubit,
                              child:
                                  BlocBuilder<StartTripCubit, StartTripState>(
                                    builder: (context, state) {
                                      return ElevatedButton(
                                        onPressed: _mapController.isLoading
                                            ? null
                                            : () {
                                                hint == 'To'
                                                    ? startTripCubit
                                                          .setToLocation(
                                                            _mapController
                                                                .mapData
                                                                .value,
                                                          )
                                                    : startTripCubit
                                                          .setFromLocation(
                                                            _mapController
                                                                .mapData
                                                                .value,
                                                          );
                                                Navigator.pop(context);
                                              },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Theme.of(
                                            context,
                                          ).primaryColor,
                                          foregroundColor: Colors.white,
                                          elevation: 2,
                                          shadowColor: Theme.of(
                                            context,
                                          ).primaryColor.withOpacity(0.3),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          hint == 'From'
                                              ? 'Confirm Pickup Location'
                                              : 'Confirm Destination',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
