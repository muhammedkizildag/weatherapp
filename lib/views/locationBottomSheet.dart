import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapp/database/LocationDatabase.dart';
import 'package:weatherapp/providers/LocationProvider.dart';

class LocationBottomSheet extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(locationState);
    return TextButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                children: [
                  Container(
                    height: 2,
                    width: 40,
                    margin: EdgeInsets.fromLTRB(0, 22, 0, 22),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(1)),
                  ),
                  Expanded(
                    child: LocationListView(ref),
                  ),
                ],
              );
            },
          );
        },
        child: Text('${location.county}, ${location.city}'));
  }
}

class LocationListView extends StatefulWidget {
  WidgetRef ref;

  LocationListView(this.ref);

  @override
  State<StatefulWidget> createState() => _LocationListView();
}

class _LocationListView extends State<LocationListView> {
  int cityindex = 0;
  bool state = false;
  @override
  Widget build(BuildContext context) {
    List l = locations[cityindex]["districts"] as List;
    return (state)
        ? ListView.builder(
            itemCount: l.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: TextButton(
                    onPressed: () {
                      setState(() {
                        widget.ref.read(locationState.notifier).changeLocation(locations[cityindex]["text"].toString(), l[index]["text"].toString());
                        Navigator.pop(context);
                      });
                    },
                    child: Text(l[index]["text"].toString())),
              );
            },
          )
        : ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                },
                title: TextButton(
                    onPressed: () {
                      setState(() {
                        cityindex = index;
                        state = true;
                      });
                    },
                    child: Text(locations[index]["text"].toString())),
              );
            },
          );
  }
}
