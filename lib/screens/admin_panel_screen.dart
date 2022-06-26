import 'package:flutter/material.dart';

import '../models/autentificare/sign_out_manager.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({Key? key}) : super(key: key);

  static const String routeName = "/adminPanel";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin panel"),
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Column(
            children: [
              const Center(
                child: Text("Hello, Admin !"),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const ElevatedButton(
                    onPressed: null,
                    child: Text("Adaugă o știre"),
                  ),
                  const ElevatedButton(
                    onPressed: null,
                    child: Text("Vezi rezervările"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      SignOutManager().delogare(context);
                    },
                    child: const Text("Delogare"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
