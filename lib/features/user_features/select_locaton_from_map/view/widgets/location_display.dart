import 'package:flutter/material.dart';
import 'package:mybenhariders/features/user_features/select_locaton_from_map/logic/map_controller.dart';

/// Location display with loading state
class LocationDisplay extends StatelessWidget {
  final MapController mapController;

  const LocationDisplay({super.key, required this.mapController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: mapController.isLoading
          ? _LoadingLocationWidget()
          : _LocationNameWidget(mapController: mapController),
    );
  }
}

/// Loading state widget
class _LoadingLocationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
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
    );
  }
}

/// Location name display widget
class _LocationNameWidget extends StatelessWidget {
  final MapController mapController;

  const _LocationNameWidget({required this.mapController});

  @override
  Widget build(BuildContext context) {
    return Text(
      mapController.mapData.value.name.isEmpty
          ? 'Select a location on the map'
          : mapController.mapData.value.name,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[700],
        fontWeight: FontWeight.w500,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
