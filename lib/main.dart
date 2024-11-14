import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapp/views/homepage.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: HomePageView(),
  )));
}


