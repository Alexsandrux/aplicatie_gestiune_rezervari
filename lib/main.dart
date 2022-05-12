import 'package:flutter/material.dart';

import 'screens/homepage_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/news_screen.dart';
import 'screens/camere_screen.dart';
import 'screens/roads_and_location.dart';
import 'screens/camera_screen.dart';
import 'screens/my_reservations_screen.dart';

import './providers/rezervari_provider.dart';

import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.purple[200],
          backgroundColor: Colors.deepPurple[50],
          primaryColorDark: Colors.purple[300],
          highlightColor: Colors.purple[600]),
      title: "Aplicatie Rezervari Pensiune",
      home: const HomepageScreen(),
      routes: {
        CamereScreen.routeName: (ctx) => const CamereScreen(),
        NewsScreen.routeName: (ctx) => const NewsScreen(),
        RoadsAndLocation.routeName: (ctx) => const RoadsAndLocation(),
        SettingsScreen.routeName: (ctx) => const SettingsScreen(),
        CameraScreen.routeName: (ctx) => const CameraScreen(),
        MyReservationsScreen.routeName: (ctx) => const MyReservationsScreen(),
      },
    );
  }
}
