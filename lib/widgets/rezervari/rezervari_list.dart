import 'package:flutter/material.dart';

import './rezervare_list_tile.dart';

import '../../DUMMY_DATA.dart';

class RezervariList extends StatelessWidget {
  const RezervariList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
