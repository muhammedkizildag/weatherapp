import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapp/providers/LocationProvider.dart';

class LocationView extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();
  List<String> items = ['Adana'];
  final isOpenedProvider = StateProvider((ref) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Location location = ref.watch(locationState);
    bool isOpened = ref.watch(isOpenedProvider);
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: TextButton(
              child: Text('${location.city}, ${location.county}'),
              onPressed: () {
                ref.read(isOpenedProvider.notifier).state = true;
              },
            ),
          ),
          Visibility(
              visible: isOpened,
              child: Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => ListTile(title: Text(items[index])),
                ),
              ))
        ],
      ),
    );
  }
}
