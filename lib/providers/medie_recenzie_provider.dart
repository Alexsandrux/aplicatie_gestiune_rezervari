import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MedieRecenzieProvider with ChangeNotifier {
  final List<double> _items = [];
  double medie = 0;

  List<double> get getItems {
    return [..._items];
  }

  void calculareMedie() async {
    double sum = 0;
    double count = 0;
    await FirebaseFirestore.instance
        .collection("recenzii")
        .where(
          "data_recenzie",
          isGreaterThanOrEqualTo: Timestamp.fromDate(
            DateTime.now().subtract(
              const Duration(days: 3),
            ),
          ),
        )
        .get()
        .then((querySnapshots) {
      // ignore: avoid_function_literals_in_foreach_calls
      querySnapshots.docs.forEach((element) {
        sum += element.data()['valoare'];
        count++;
      });
    }).then((value) => medie = sum / count);
  }

  double getMedie() {
    return medie;
  }
}
