import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/rezervare.dart';

class RezervareListTile extends StatelessWidget {
  final Rezervare rezervare;

  const RezervareListTile({required this.rezervare, Key? key})
      : super(key: key);

  Widget RowColumnBuilder(String superiorText, String inferiorText) {
    return Column(
      children: [
        Text(superiorText),
        const SizedBox(
          height: 1,
        ),
        Text(inferiorText)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: const Color.fromARGB(255, 52, 135, 173), width: 1),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(128, 72, 209, 129),
            Color.fromARGB(128, 246, 182, 13),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RowColumnBuilder(
                "Data sosire rezervare: ",
                DateFormat.yMd().format(rezervare.dataSosire).toString(),
              ),
              RowColumnBuilder(
                "Data plecare rezervare: ",
                DateFormat.yMd().format(rezervare.dataPlecare).toString(),
              ),
              RowColumnBuilder("Pret: ",
                  "200"), // de calculat pretul cand facem request-ul catre camera cand am legatura cu baza de date
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          RowColumnBuilder("Camera:", rezervare.idCamera)
        ],
      ),
    );
  }
}
