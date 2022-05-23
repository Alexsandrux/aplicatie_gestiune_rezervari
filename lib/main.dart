import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'screens/homepage_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/news_screen.dart';
import 'screens/camere_screen.dart';
import 'screens/roads_and_location.dart';
import 'screens/camera_screen.dart';
import 'screens/my_reservations_screen.dart';
// ignore: unused_import
import 'screens/admin_panel_screen.dart';
import 'screens/auth_screen.dart';

import './providers/rezervari_provider.dart';
import './providers/camere_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => RezervariProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => CamereProvider()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.purple[200],
            backgroundColor: Colors.deepPurple[50],
            primaryColorDark: Colors.purple[300],
            highlightColor: Colors.purple[600]),
        title: "Aplicatie Rezervari Pensiune",
        // ignore: dead_code
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot<User?> snapshot) {
              if (snapshot.hasData) {
                return const HomepageScreen();
              }
              return const AuthScreen(); // TODO: dupa inregistrare nu se schimba imaginea
            }),
        routes: {
          "/home": (ctx) => const HomepageScreen(),
          CamereScreen.routeName: (ctx) => const CamereScreen(),
          NewsScreen.routeName: (ctx) => const NewsScreen(),
          RoadsAndLocation.routeName: (ctx) => const RoadsAndLocation(),
          SettingsScreen.routeName: (ctx) => const SettingsScreen(),
          CameraScreen.routeName: (ctx) => const CameraScreen(),
          MyReservationsScreen.routeName: (ctx) => const MyReservationsScreen(),
          AuthScreen.routeName: (ctx) => const AuthScreen(),
        },
      ),
    );
  }
}
