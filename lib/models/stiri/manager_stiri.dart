import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ManagerStiri {
  void incarcaStire(String descriere, String urlImagine, BuildContext context) {
    FirebaseFirestore.instance.collection("stiri").add({
      "descriere": descriere,
      "urlImagine": urlImagine,
      "data_adaugare": DateTime.now(),
    }).then((value) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Stirea a fost adaugată cu succes!"))));
  }
}
