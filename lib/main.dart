import 'package:flutter/material.dart';
import 'package:planet_app/scrrens/detail%20page.dart';
import 'package:planet_app/scrrens/home%20page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),

      '/detail': (context) => const DetailPage(),
    },
  ));
}
