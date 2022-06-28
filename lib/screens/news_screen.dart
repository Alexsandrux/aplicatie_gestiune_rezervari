import 'package:flutter/material.dart';
import '../widgets/drawer/main_drawer.dart';
import '../widgets/stiri/stiri_list.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = "/news";

  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: const StiriList(),
      appBar: AppBar(
        title: const Text("Noutăți"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
