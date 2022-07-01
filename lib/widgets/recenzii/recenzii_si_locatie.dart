import 'package:aplicatie_gestiune_rezervari/widgets/recenzii/recenzie.dart';
import 'package:flutter/material.dart';

import '../drawer/main_drawer.dart';

class RecenzieSiLocatie extends StatelessWidget {
  const RecenzieSiLocatie({
    Key? key,
    required this.medie,
  }) : super(key: key);

  final double medie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: Column(
        children: [
          const Recenzie(),
          const Center(
            child: Text(
              "Atenție! Puteți oferi o recenzie a drumului doar o dată pe zi!",
              style: TextStyle(color: Colors.red),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Medie: ${double.parse(medie.toString()).toStringAsFixed(2)}",
              textScaleFactor: 1.5,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "Adresă:",
            ),
          ),
          const Center(
            child: Text(
              "Strada lalelelor nr. 22",
            ),
          ),
          const Spacer(),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "Atenție!!",
              style: TextStyle(color: Colors.red),
            ),
          ),
          const Center(
            child: Text(
                "O medie mare a recenzilor nu rezultă automat că drumul este bun de circulat pentru toate mașinile.",
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center),
          ),
          const Center(
            child: Text(
              "Poate însemna că drumul este mai bun comparativ cu alte zile.",
              style: TextStyle(color: Colors.red),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text("Stare drumuri și locație"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
