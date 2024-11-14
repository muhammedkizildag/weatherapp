import 'package:flutter_riverpod/flutter_riverpod.dart';

class Location {
  Location({required this.city, required this.county});
  final String city;
  final String county;
}

class LocationNotifier extends StateNotifier<Location> {
  LocationNotifier() : super(Location(city: 'Adana', county: 'Kozan'));

  void changeLocation(city, county) {
    state = Location(city: city, county: county);
  }
}

final locationState = StateNotifierProvider<LocationNotifier, Location>((ref) => LocationNotifier());
