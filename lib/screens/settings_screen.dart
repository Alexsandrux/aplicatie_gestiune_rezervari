import 'package:aplicatie_gestiune_rezervari/models/autentificare/sign_out_manager.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer/main_drawer.dart';

import '../screens/auth_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = "/settings";

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: const MainDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(
            flex: 2,
          ),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                  const Size.fromHeight(double.infinity)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
            ),
            onPressed: () {
              SignOutManager().delogare(context);
            },
            child: const Text("Delogare"),
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
      appBar: AppBar(
        title: const Text("Setări"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
