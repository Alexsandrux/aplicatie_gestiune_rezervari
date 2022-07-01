import 'package:flutter/material.dart';

import '../../providers/rezervari_user_provider.dart';
import './rezervare_list_tile.dart';

import 'package:provider/provider.dart';

import '../../models/rezervare.dart';

class RezervariList extends StatefulWidget {
  const RezervariList({Key? key}) : super(key: key);

  @override
  State<RezervariList> createState() => _RezervariListState();
}

class _RezervariListState extends State<RezervariList> {
  bool redeseneaza = true;

  void redesenare() {
    setState(() {
      redeseneaza = !redeseneaza;
    });
  }

  @override
  Widget build(BuildContext context) {
    final rezervariData = Provider.of<RezervariUserProvider>(context);

    List<Rezervare> rezervari = rezervariData.getItems;
    rezervari.sort(
      (a, b) => a.dataInregistrareRezervare.isAfter(b.dataInregistrareRezervare)
          ? 0
          : 1,
    );

    return rezervari.isEmpty
        ? const Text("Nu a fost găsită nicio înregistrare")
        : ListView.builder(
            itemCount: rezervari.length,
            itemBuilder: ((context, index) {
              return RezervareListTile(
                  functie: redesenare, rezervare: rezervari[index]);
            }),
          );
  }
}
