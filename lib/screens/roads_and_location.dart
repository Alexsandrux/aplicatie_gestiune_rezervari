import 'package:aplicatie_gestiune_rezervari/providers/medie_recenzie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/recenzii/recenzii_si_locatie.dart';

class RoadsAndLocation extends StatelessWidget {
  static const String routeName = "/roads_and_location";

  const RoadsAndLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var medieRecenzieData =
        Provider.of<MedieRecenzieProvider>(context, listen: false);
    medieRecenzieData.calculareMedie();
    return const RecenzieSiLocatie();
  }
}
