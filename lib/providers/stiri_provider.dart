import 'package:aplicatie_gestiune_rezervari/models/stire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StiriProvider with ChangeNotifier {
  final List<Stire> _items = [];

  List<Stire> get getItems {
    return [..._items];
  }

  Future<void> fetchStiri() async {
    _items.clear();
    await FirebaseFirestore.instance
        .collection('stiri')
        .orderBy("data_adaugare", descending: true)
        .get()
        .then((data) {
      for (var item in data.docs) {
        _items.add(Stire(
          url: item["urlImagine"],
          descriere: item["descriere"],
        ));
      }
    });
  }
}
