import 'package:flutter/material.dart';
import 'package:to_do_app/pages/home.dart';
import 'package:to_do_app/pages/main_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const MainScreen(),
      '/todo':(context) => const Home(),
    },
  ));
}
