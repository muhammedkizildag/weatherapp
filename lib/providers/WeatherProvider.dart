import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/providers/LocationProvider.dart';

final weatherProvider = FutureProvider(
  (ref) async {
    Location local = ref.watch(locationState);
    var response = await http.get(
      Uri.parse('http://10.0.2.2:3000/?city=${local.city}&county=${local.county}'),
      // headers: {'city': local.city, 'county': local.county}
    );
    return jsonDecode(response.body);
  },
);
