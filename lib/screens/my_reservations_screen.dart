import 'package:flutter/material.dart';
import '../widgets/drawer/main_drawer.dart';

import '../widgets/rezervari/rezervari_list.dart';

class MyReservationsScreen extends StatelessWidget {
  static const String routeName = "/rezervarile_mele";

  const MyReservationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: const MainDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        title: const Text("Rezervările mele"),
      ),
      body: const Center(
        child: RezervariList(),
      ),
    );
  }
}
