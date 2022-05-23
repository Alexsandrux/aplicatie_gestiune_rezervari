import 'package:flutter/material.dart';

import '../widgets/drawer/main_drawer.dart';

import '../screens/auth_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = "/settings";

  const SettingsScreen({Key? key}) : super(key: key);

  void delogare(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Setări"),
            ElevatedButton(
              onPressed: () {
                delogare(context);
              },
              child: const Text("Delogare"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Setări"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
