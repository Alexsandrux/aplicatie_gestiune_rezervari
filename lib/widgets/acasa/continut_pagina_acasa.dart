import 'package:flutter/material.dart';

import '../drawer/main_drawer.dart';

class ContinutPaginaAcasa extends StatelessWidget {
  const ContinutPaginaAcasa({
    Key? key,
  }) : super(key: key);

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
