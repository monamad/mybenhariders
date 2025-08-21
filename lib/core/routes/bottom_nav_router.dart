import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mybenhariders/core/local_data_source/get_location.dart';
import 'package:mybenhariders/core/routes/routes.dart';
import 'package:mybenhariders/features/user_features/activities/view/activities_view.dart';
import 'package:mybenhariders/features/check_location_perrmissions/logic/cubit/location_permission_cubit.dart';
import 'package:mybenhariders/features/user_features/help/view/help_view.dart';
import 'package:mybenhariders/features/user_features/home/view/home_view.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/logic/cubit/start_trip_cubit.dart';
import 'package:mybenhariders/features/user_features/my_start_trip/view/my_start_trip_view.dart';
import 'package:mybenhariders/features/user_features/profile/view/profile_view.dart';

class BottomNavRouter {
  static Route<dynamic> generateHomeRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeTab:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.startTrip:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<LocationPermissionCubit>(
                create: (context) =>
                    LocationPermissionCubit(GetIt.instance.get<GetLocation>()),
              ),
              BlocProvider<StartTripCubit>(
                create: (context) =>
                    GetIt.instance.get<StartTripCubit>()..initialize(),
              ),
            ],
            child: MyStartTripView(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }

  static Route<dynamic> generateHelpRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.helpTab:
        return MaterialPageRoute(builder: (_) => HelpPage());
      default:
        return MaterialPageRoute(builder: (_) => HelpPage());
    }
  }

  static Route<dynamic> generateActivitiesRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.activitiesTab:
        return MaterialPageRoute(builder: (_) => ActivitiesPage());
      case Routes.activityDetails:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: Text('Activity Details')),
            body: Center(child: Text('Activity Details Page')),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => ActivitiesPage());
    }
  }

  static Route<dynamic> generateProfileRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.profileTab:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case Routes.profileEdit:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: Text('Edit Profile')),
            body: Center(child: Text('Edit Profile Page')),
          ),
        );
      case Routes.profileSettings:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: Text('Profile Settings')),
            body: Center(child: Text('Profile Settings Page')),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => ProfilePage());
    }
  }
}
