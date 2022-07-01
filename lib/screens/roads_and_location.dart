import 'package:aplicatie_gestiune_rezervari/providers/medie_recenzie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/recenzii/recenzii_si_locatie.dart';

class RoadsAndLocation extends StatefulWidget {
  static const String routeName = "/roads_and_location";

  const RoadsAndLocation({Key? key}) : super(key: key);

  @override
  State<RoadsAndLocation> createState() => _RoadsAndLocationState();
}

class _RoadsAndLocationState extends State<RoadsAndLocation> {
  @override
  Widget build(BuildContext context) {
    var medieRecenzieData = Provider.of<MedieRecenzieProvider>(context);
    medieRecenzieData.calculareMedie();
    double medie = medieRecenzieData.getMedie();
    return RecenzieSiLocatie(medie: medie);
  }
}
