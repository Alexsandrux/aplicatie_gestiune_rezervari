import 'package:aplicatie_gestiune_rezervari/providers/rezervari_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/camere_provider.dart';
import '../widgets/drawer/main_drawer.dart';

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
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: const Center(
        child: Text("Bine ati venit!"),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
