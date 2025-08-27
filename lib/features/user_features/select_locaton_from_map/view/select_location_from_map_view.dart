import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/data/models/location_model.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/logic/cubit/start_trip_cubit.dart';
import 'package:mybenhariders/features/user_features/select_locaton_from_map/logic/map_controller.dart';
import 'package:mybenhariders/features/user_features/select_locaton_from_map/view/widgets/google_maps_widget.dart';
import 'package:mybenhariders/features/user_features/select_locaton_from_map/view/widgets/location_info_card.dart';

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
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                GoogleMapsWidget(
                  mapController: _mapController,
                  initialPosition: initialPosition,
                  zoom: 15.0,
                ),
                Center(
                  child: Icon(
                    Icons.add,
                    size: 32,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                LocationInfoCard(
                  mapController: _mapController,
                  startTripCubit: startTripCubit,
                  hint: hint,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
