import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/providers/LocationProvider.dart';

final weatherProvider = FutureProvider(
  (ref) async {
    Location local = ref.watch(locationState);
    var r = await http.get(Uri.parse('https://servis.mgm.gov.tr/web/merkezler?il=${local.city}&ilce=${local.county}'),
        headers: {'Origin': 'https://www.mgm.gov.tr'});

    var j = jsonDecode(r.body);

    var r2 = await http.get(Uri.parse('https://servis.mgm.gov.tr/web/sondurumlar?merkezid=${j[0]["merkezId"]}'),
        headers: {'Origin': 'https://www.mgm.gov.tr'});


    var j2 = jsonDecode(r2.body);

    // var response = await http.get(
    //   Uri.parse('http://10.0.2.2:3000/?city=${local.city}&county=${local.county}'),
    // );

    return {'temp': j2[0]['sicaklik'], 'link': 'https://www.mgm.gov.tr/Images_Sys/hadiseler/${j2[0]['hadiseKodu']}.svg'};
  },
);
