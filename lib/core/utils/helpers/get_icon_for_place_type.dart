import 'package:flutter/material.dart';

IconData getIconForPlaceType(List<String>? types) {
  if (types == null || types.isEmpty) return Icons.place;

  // Transportation
  if (types.contains('airport')) return Icons.flight;
  if (types.contains('bus_station')) return Icons.directions_bus;
  if (types.contains('train_station')) return Icons.train;
  if (types.contains('subway_station')) return Icons.subway;

  // Commercial
  if (types.contains('shopping_mall')) return Icons.shopping_bag;
  if (types.contains('store')) return Icons.store;
  if (types.contains('supermarket')) return Icons.shopping_cart;

  // Services
  if (types.contains('hospital')) return Icons.local_hospital;
  if (types.contains('pharmacy')) return Icons.local_pharmacy;
  if (types.contains('bank')) return Icons.account_balance;
  if (types.contains('atm')) return Icons.atm;

  // Education & Recreation
  if (types.contains('school')) return Icons.school;
  if (types.contains('university')) return Icons.school;
  if (types.contains('library')) return Icons.library_books;
  if (types.contains('park')) return Icons.park;
  if (types.contains('gym')) return Icons.fitness_center;

  // Food & Drink
  if (types.contains('restaurant')) return Icons.restaurant;
  if (types.contains('cafe')) return Icons.local_cafe;
  if (types.contains('bar')) return Icons.local_bar;

  // Automotive
  if (types.contains('gas_station')) return Icons.local_gas_station;
  if (types.contains('car_repair')) return Icons.car_repair;
  if (types.contains('parking')) return Icons.local_parking;

  // Government & Religious
  if (types.contains('city_hall')) return Icons.account_balance;
  if (types.contains('courthouse')) return Icons.gavel;
  if (types.contains('church')) return Icons.church;
  if (types.contains('mosque')) return Icons.mosque;

  // Geographic
  if (types.contains('locality')) return Icons.location_city;
  if (types.contains('sublocality')) return Icons.location_on;
  if (types.contains('administrative_area_level_1')) return Icons.flag;
  if (types.contains('country')) return Icons.public;

  return Icons.place;
}
