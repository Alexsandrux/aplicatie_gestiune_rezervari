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
}
