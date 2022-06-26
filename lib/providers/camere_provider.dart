import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/camera.dart';

class CamereProvider with ChangeNotifier {
  final List<Camera> _items = [];

  List<Camera> get getItems {
    return [..._items];
  }

  Camera getCamera(String id) {
    return _items.firstWhere((element) => element.idCamera == id);
  }

  Future<void> fetchCamere() async {
    _items.clear();
    await FirebaseFirestore.instance.collection('camere').get().then((data) {
      for (var item in data.docs) {
        _items.add(
          Camera(
            areBalcon: item['areBalcon'],
            etaj: item['etaj'],
            idCamera: item.id,
            numarCamera: item['numarCamera'],
            numarLocuriCamera: item['numarLocuriCamera'],
            pret: double.parse(item['pret'].toString()),
            urlImagine: item['urlImagine'],
            descriere: item['descriere'],
          ),
        );
      }
    });
  }
}
