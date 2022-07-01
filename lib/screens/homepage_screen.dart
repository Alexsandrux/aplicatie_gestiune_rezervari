import 'package:aplicatie_gestiune_rezervari/providers/rezervari_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/camere_provider.dart';
import '../providers/stiri_provider.dart';
import '../widgets/acasa/continut_pagina_acasa.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  void didChangeDependencies() {
    Provider.of<CamereProvider>(context).fetchCamere();
    Provider.of<RezervariUserProvider>(context).getRezervariUser();
    Provider.of<StiriProvider>(context, listen: false).fetchStiri();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const ContinutPaginaAcasa();
  }
}
