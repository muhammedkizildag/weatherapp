import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherapp/providers/LocationProvider.dart';
import 'package:weatherapp/providers/WeatherProvider.dart';
import 'package:weatherapp/views/locationBottomSheet.dart';

class HomePageView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(locationState);
    return Scaffold(
        appBar: AppBar(leading: const Icon(Icons.location_on_outlined, size: 40), title: LocationBottomSheet(),),
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 19, 132, 224), Color.fromARGB(255, 97, 194, 239)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Weatherview(location)
          ],
        ),
      ),
    ));
  }
}

class Weatherview extends ConsumerWidget {
  Weatherview(this.location);
  Location location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(weatherProvider);
    return data.when(
      data: (data) {
        return Column(
          children: [
            SvgPicture.network(
              data['link'],
              placeholderBuilder: (context) => const CircularProgressIndicator(),
              height: 200,
            ),
            Text(
              '${data['temp'].toString()}°',
              style: const TextStyle(fontSize: 32, color: Colors.white),
            )
          ],
        );
      },
      loading: () {
        return const CircularProgressIndicator();
      },
      error: (error, stackTrace) {
        return const Text('Hata Oluştu!');
      },
    );
  }
}
