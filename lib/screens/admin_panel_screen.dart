import 'package:flutter/material.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({Key? key}) : super(key: key);

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
                child: Text("hello admmin ! "),
              ),
              Row(
                children: const [
                  ElevatedButton(
                    onPressed: null,
                    child: Text("Adaugă o știre"),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: Text("Vezi rezervările"),
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
