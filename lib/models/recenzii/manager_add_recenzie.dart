import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ManagerAddRecenzie {
  void addRecenzie(double valoare, context) async {
    await FirebaseFirestore.instance
        .collection("recenzii")
        .add({
          "id_utilizator": FirebaseAuth.instance.currentUser!.uid,
          "data_recenzie": DateTime.now(),
          "valoare": valoare
        })
        .timeout(
          const Duration(seconds: 10),
        )
        .then(
          (value) {
            return ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Recenzia a fost adaugată cu succes!"),
              ),
            );
          },
        )
        .onError(
          (error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("A avut loc o eroare in adăugarea recenziei!"),
            ),
          ),
        );
  }
}
