import 'package:flutter/material.dart';
import 'package:world_clock/pages/Home.dart';
import 'package:world_clock/pages/Choose_Location.dart';
import 'package:world_clock/pages/Loading.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },

  ));
}
