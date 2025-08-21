import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/logic/cubit/start_trip_cubit.dart';

class LocatonTextField extends StatelessWidget {
  final StartTripState? state;
  final TextEditingController textEditingController;
  final String formTypeLabel;
  final String hint;
  const LocatonTextField({
    super.key,
    required this.textEditingController,
    required this.formTypeLabel,
    required this.hint,
    this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          formTypeLabel,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
            children: [
              // Text field
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                  onChanged: (value) {
                    context.read<StartTripCubit>().removeValidation(hint);
                    if (value.length > 1) {
                      context.read<StartTripCubit>().startSearch(value, hint);
                    } else {
                      context.read<StartTripCubit>().stopSearch();
                    }
                  },
                  onSubmitted: (value) {},
                ),
              ),
              IconButton(
                icon: Icon(Icons.clear, color: Colors.grey[500]),
                onPressed: () {
                  textEditingController.clear();
                  context.read<StartTripCubit>().stopSearch();
                  context.read<StartTripCubit>().removeValidation(hint);
                },
              ),
              // Loading or Map icon
              Container(
                padding: EdgeInsets.all(12),
                child: (state != null && state?.getingCurrentLocation == true)
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.location_on,
                          color: Theme.of(context).primaryColor,
                          size: 24,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
