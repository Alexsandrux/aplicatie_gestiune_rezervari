import 'package:flutter/material.dart';
import '../widgets/drawer/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = "/settings";

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: const Center(
        child: Text("Setări"),
      ),
      appBar: AppBar(
        title: const Text("Setări"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
