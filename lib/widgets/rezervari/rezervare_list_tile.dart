import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/stare_anulata.dart';
import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/stare_finalizata.dart';
import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/stare_in_curs_de_rezervare.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/rezervare.dart';
import '../../providers/camere_provider.dart';

class RezervareListTile extends StatelessWidget {
  final Rezervare rezervare;

  const RezervareListTile({required this.rezervare, Key? key})
      : super(key: key);

  Widget rowColumnBuilder(String superiorText, String inferiorText) {
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

  Color alegereCuloareDupaStare() {
    if (rezervare.getStare.runtimeType == StareAnulata) {
      return Colors.red;
    } else if (rezervare.getStare.runtimeType == StareInCursDeRezervare) {
      return Colors.blueAccent;
    } else if (rezervare.getStare.runtimeType == StareFinalizata) {
      return Colors.blueGrey;
    }
    return Colors.greenAccent;
  }

  @override
  Widget build(BuildContext context) {
    var cameraData =
        Provider.of<CamereProvider>(context).getCamera(rezervare.idCamera);
    Color culoare = alegereCuloareDupaStare();
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: culoare,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              rowColumnBuilder(
                "Data sosire rezervare: ",
                DateFormat.yMd().format(rezervare.dataSosire).toString(),
              ),
              rowColumnBuilder(
                "Data plecare rezervare: ",
                DateFormat.yMd().format(rezervare.dataPlecare).toString(),
              ),
              rowColumnBuilder(
                  "Pret: ",
                  cameraData.pret
                      .toString()), // de calculat pretul cand facem request-ul catre camera cand am legatura cu baza de date
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          rowColumnBuilder("Camera:", cameraData.numarCamera)
        ],
      ),
    );
  }
}
