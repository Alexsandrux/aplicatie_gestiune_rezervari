import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class LogareScreen extends StatefulWidget {
  const LogareScreen({Key? key}) : super(key: key);

  static const String routeName = "/loginPage";

  @override
  _LogareScreenState createState() => _LogareScreenState();
}

void testFirebase() {
  FirebaseFirestore.instance.collection('camere').snapshots().listen((event) {
    event.docs.forEach((element) {
      print(element['numarCamera']);
    });
  });
}

class _LogareScreenState extends State<LogareScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: IconButton(
          onPressed: testFirebase,
          icon: Icon(Icons.add_reaction_outlined),
        ),
      ),
    );
  }
}
