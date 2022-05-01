import 'package:flutter/material.dart';
import '../widgets/drawer/main_drawer.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = "/news";

  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: const Center(
        child: Text("Test"),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
