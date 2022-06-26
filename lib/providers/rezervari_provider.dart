import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/convert_text_stare.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/rezervare.dart';

class RezervariProvider with ChangeNotifier {
  final List<Rezervare> _items = [];

  List<Rezervare> get getItems {
    return [..._items];
  }

  void addItem(Rezervare rezervare) {
    _items.add(rezervare);

    notifyListeners();
  }

  void removeItem(String idRezervareDeSters) {
    Rezervare rezervareCareVaFiStearsa = _items
        .firstWhere((element) => element.idRezervare == idRezervareDeSters);

    _items.remove(rezervareCareVaFiStearsa);

    notifyListeners();
  }

  void getRezervariDupaData() async {
    _items.clear();
    await FirebaseFirestore.instance
        .collection('rezervari')
        .where('stare', isNotEqualTo: "StareAnulata")
        .get()
        .then((data) {
      for (var item in data.docs) {
        Rezervare rezervare = Rezervare(
          idCamera: item["idCamera"],
          dataSosire: (item["dataSosire"] as Timestamp).toDate(),
          dataPlecare: (item["dataPlecare"] as Timestamp).toDate(),
          dataInregistrareRezervare:
              (item["dataInregistrareRezervare"] as Timestamp).toDate(),
          idUtilizator: item["idUtilizator"],
        );
        rezervare.idRezervare = item.id;
        ConvertorTextInStare().transformaTextInStare(rezervare, item['stare']);
        _items.add(rezervare);
      }
    });
  }
}
