import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/rezervari_provider.dart';
import '../widgets/drawer/main_drawer.dart';
import '../widgets/camere/grid_camere.dart';
import '../widgets/camere/date_panel.dart';

class CamereScreen extends StatefulWidget {
  static const String routeName = "/camere";

  const CamereScreen({Key? key}) : super(key: key);

  @override
  State<CamereScreen> createState() => _CamereScreenState();
}

class _CamereScreenState extends State<CamereScreen> {
  DateTime? dataSosire;

  DateTime? dataPlecare;

  void _dataSosirePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 90),
      ),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      if (dataPlecare == null) {
        setState(() {
          dataSosire = pickedDate;
        });
        return;
      }
      if (pickedDate.isBefore(dataPlecare!)) {
        setState(() {
          dataSosire = pickedDate;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Data sosirii nu poate fi după data plecări!!!")));
      }
    });
  }

  void _dataPlecarePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 90),
      ),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      if (dataSosire == null) {
        setState(() {
          dataPlecare = pickedDate;
        });
        return;
      }
      if (pickedDate.isAfter(dataSosire!)) {
        setState(() {
          dataPlecare = pickedDate;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Data sosirii nu poate fi după data plecări!!!")));
      }
    });
  }

  @override
  void didChangeDependencies() {
    Provider.of<RezervariProvider>(context).getRezervariDupaData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rezervă camera"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const MainDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DatePanel(
                  choosedDate: dataSosire,
                  title: "Data Sosire: ",
                  missingMesssage: "Alegeti data sosirii",
                  dataPicker: _dataSosirePicker),
              DatePanel(
                  choosedDate: dataPlecare,
                  title: "Data Plecare: ",
                  missingMesssage: "Alegeti data plecării",
                  dataPicker: _dataPlecarePicker),
            ],
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height) * 0.35,
              // ignore: unnecessary_null_comparison
              child: (dataPlecare != null && dataSosire != null)
                  ? GridCamere(
                      dataSosire: dataSosire!,
                      dataPlecare: dataPlecare!,
                    )
                  : const Center(
                      child: Text(
                        "Va rugam selectati data de sosire si data de plecare a rezervarii",
                        style: TextStyle(),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
