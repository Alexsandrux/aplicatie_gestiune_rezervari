import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/convert_text_stare.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/rezervare.dart';

class RezervariUserProvider with ChangeNotifier {
  final List<Rezervare> _items = [];

  List<Rezervare> get getItems {
    return [..._items];
  }

  void addItem(Rezervare rezervare) {
    _items.add(rezervare);

    notifyListeners();
  }

  Future<void> getRezervariUser() async {
    _items.clear();

    var data = await FirebaseFirestore.instance
        .collection("rezervari")
        .where("idUtilizator",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    for (var rezervare in data.docs) {
      Rezervare rezervareNoua = Rezervare(
        idCamera: rezervare["idCamera"],
        dataSosire: (rezervare["dataSosire"] as Timestamp).toDate(),
        dataPlecare: (rezervare["dataPlecare"] as Timestamp).toDate(),
        dataInregistrareRezervare:
            (rezervare["dataInregistrareRezervare"] as Timestamp).toDate(),
        idUtilizator: rezervare["idUtilizator"],
      );
      rezervareNoua.idRezervare = rezervare.id;
      ConvertorTextInStare()
          .transformaTextInStare(rezervareNoua, rezervare['stare']);
      _items.add(rezervareNoua);
    }
  }
}
