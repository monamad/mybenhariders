import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybenhariders/core/utils/helpers/get_icon_for_place_type.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/logic/cubit/start_trip_cubit.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/view/widgets/locaton_text_field.dart';

class SelectLocationsCard extends StatelessWidget {
  const SelectLocationsCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(
                  Icons.directions_car,
                  color: Theme.of(context).primaryColor,
                  size: 28,
                ),
                SizedBox(width: 12),
                Text(
                  'Where are you going?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[700],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            BlocBuilder<StartTripCubit, StartTripState>(
              builder: (context, state) {
                return Column(
                  children: [
                    LocatonTextField(
                      state: state,
                      textEditingController: context
                          .read<StartTripCubit>()
                          .fromLocationController,
                      formTypeLabel: 'Enter your pickup location',
                      hint: 'From',
                    ),

                    SizedBox(height: 20.h),

                    LocatonTextField(
                      textEditingController: context
                          .read<StartTripCubit>()
                          .toLocationController,
                      formTypeLabel: 'Enter your destination',
                      hint: 'To',
                    ),
                    if (state.isSearching)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.autoCompleteSuggestions.length,
                          separatorBuilder: (context, index) =>
                              Divider(height: 1, color: Colors.grey[200]),
                          itemBuilder: (context, index) {
                            final suggestion = state.autoCompleteSuggestions; //
                            return ListTile(
                              leading: Icon(
                                getIconForPlaceType(
                                  suggestion[index].types?.cast<String>(),
                                ),
                                color: Colors.grey[600],
                                size: 20,
                              ),
                              title: Text(
                                suggestion[index].description!, //
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    suggestion[index]
                                        .structuredFormatting!
                                        .mainText!, //
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  // Show debug info in development mode
                                  if (kDebugMode) ...[SizedBox(height: 4)],
                                ],
                              ),
                              onTap: () {
                                print(
                                  'Tapped on: ${suggestion[index].description}',
                                );
                                context.read<StartTripCubit>().stopSearch();

                                context.read<StartTripCubit>().getPlaceDetails(
                                  suggestion[index].placeId!,
                                );
                              },
                            );
                          },
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
