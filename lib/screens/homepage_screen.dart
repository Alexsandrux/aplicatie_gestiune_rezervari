import 'package:flutter/material.dart';
import '../widgets/drawer/main_drawer.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: const Center(
        child: Text("Bine ati venit!"),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
