import 'package:aplicatie_gestiune_rezervari/widgets/recenzii/recenzie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/medie_recenzie_provider.dart';
import '../drawer/main_drawer.dart';

class RecenzieSiLocatie extends StatefulWidget {
  const RecenzieSiLocatie({
    Key? key,
  }) : super(key: key);

  @override
  State<RecenzieSiLocatie> createState() => _RecenzieSiLocatieState();
}

class _RecenzieSiLocatieState extends State<RecenzieSiLocatie> {
  double medieBuna = 0;

  @override
  void didChangeDependencies() {
    var medieRecenzieData =
        Provider.of<MedieRecenzieProvider>(context, listen: true);
    medieBuna = medieRecenzieData.getMedie();
    super.didChangeDependencies();
  }

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
              "Medie: ${double.parse(medieBuna.toString()).toStringAsFixed(2)}",
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
              "Muntele Alb, Romani, Jud. Vâlcea,",
            ),
          ),
          Center(
            child: Image.asset(
              "lib/assets/pictures/locatie_gmaps.png",
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
