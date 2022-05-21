import 'package:flutter/material.dart';

import './rezervare_list_tile.dart';

import 'package:provider/provider.dart';

import '../../providers/rezervari_provider.dart';

import '../../models/rezervare.dart';

class RezervariList extends StatelessWidget {
  const RezervariList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rezervariData = Provider.of<RezervariProvider>(context);
    List<Rezervare> rezervari = rezervariData.getItems;

    return rezervari.isEmpty
        ? const Text("Nu a fost găsită nicio înregistrare")
        : ListView.builder(
            itemCount: rezervari.length,
            itemBuilder: ((context, index) {
              return RezervareListTile(rezervare: rezervari[index]);
            }),
          );
  }
}
