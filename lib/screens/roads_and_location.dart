import 'package:flutter/material.dart';
import '../widgets/drawer/main_drawer.dart';

class RoadsAndLocation extends StatelessWidget {
  static const String routeName = "/roads_and_location";

  const RoadsAndLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: const Center(child: Text("Stare drumuri și locație")),
      appBar: AppBar(
        title: const Text("Stare drumuri și locație"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
