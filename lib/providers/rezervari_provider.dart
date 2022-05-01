import 'package:flutter/material.dart';

import '../models/rezervare.dart';

class RezervariProvider with ChangeNotifier {
  List<Rezervare> _items = [];

  List<Rezervare> get getItems {
    return [..._items];
  }
}
