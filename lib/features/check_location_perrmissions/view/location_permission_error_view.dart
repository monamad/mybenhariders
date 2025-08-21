import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybenhariders/core/themes/colors.dart';
import 'package:mybenhariders/core/utils/helpers/location_ui_helper.dart';
import 'package:mybenhariders/features/check_location_perrmissions/logic/cubit/location_permission_cubit.dart';
import 'package:mybenhariders/features/check_location_perrmissions/view/action_button.dart';

class LocationPermissionErrorView extends StatelessWidget {
  const LocationPermissionErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationPermissionCubit, LocationPermissionState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Location Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  GetIconForLocationType.getIcon(state.errorType),
                  size: 60,
                  color: ColorManager.mainOrage,
                ),
              ),

              const SizedBox(height: 30),

              // Title
              Text(
                GetLocationTypeTitle.getTitle(state.errorType),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Description
              if (state.errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    state.errorMessage,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              const SizedBox(height: 40),

              // Action Button
              LocationActionButton(state: state),
            ],
          ),
        );
      },
    );
  }
}
