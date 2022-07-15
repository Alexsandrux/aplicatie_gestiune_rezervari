import 'package:aplicatie_gestiune_rezervari/models/rezervare.dart';
import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/convert_text_stare.dart';
import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/stare_in_curs_de_rezervare.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/rezervari_user_provider.dart';

class RezervareAdminTile extends StatelessWidget {
  final DateTime dataSosire;
  final DateTime dataPlecare;
  final DateTime dataInregistrare;
  final String idCamera;
  final String idUtilizator;
  final String stareRezervare;
  final String idRezervare;

  const RezervareAdminTile(
      {required this.stareRezervare,
      required this.dataSosire,
      required this.dataPlecare,
      required this.dataInregistrare,
      required this.idCamera,
      required this.idUtilizator,
      required this.idRezervare,
      Key? key})
      : super(key: key);

  Future<DocumentSnapshot> getCameraDocument() async {
    return FirebaseFirestore.instance.collection("camere").doc(idCamera).get();
  }

  Future<DocumentSnapshot> getUserDocument() async {
    return FirebaseFirestore.instance
        .collection("utilizatori")
        .doc(idUtilizator)
        .get();
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Finalizare Rezervare'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Center(
                    child: Text('Doriti sa finalizati operatia de rezervare?')),
                Center(
                  child: Text(
                      'Acest lucru presupune ca utilizatorul să nu mai fie nevoit să plătească avansul aferent unei rezervări!'),
                ),
                Center(
                  child: Text(
                    'Atenție! Rezervarea trebuie să se afle în starea în curs de rezervare pentru a putea fi considerată camera rezervată!',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('NU!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('DA!'),
              onPressed: () {
                Rezervare rezervare = Rezervare(
                    idCamera: idCamera,
                    dataSosire: dataSosire,
                    dataPlecare: dataPlecare,
                    dataInregistrareRezervare: dataInregistrare,
                    idUtilizator: idUtilizator);
                ConvertorTextInStare()
                    .transformaTextInStare(rezervare, stareRezervare);
                rezervare.idRezervare = idRezervare;
                if (rezervare.getStare.runtimeType.toString() ==
                    StareInCursDeRezervare().runtimeType.toString()) {
                  Provider.of<RezervariUserProvider>(context, listen: false)
                      .platesteAvansRezervare(rezervare, context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Text("Rezervarea a fost actualizată cu succes!")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          "A avut loc o eroare! Rezervarea nu se află în starea: \"ÎN CURS DE REZERVARE\"")));
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _showMyDialog(context),
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(3),
        child: Card(
          elevation: 12,
          color: const Color.fromARGB(255, 163, 190, 212),
          child: Column(
            children: [
              FutureBuilder(
                  future: getUserDocument(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        color: const Color.fromARGB(255, 169, 196, 218),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text("Nume: ${snapshot.data!['nume']} "),
                            Text("Prenume: ${snapshot.data!['prenume']} "),
                            Text("E-mail: ${snapshot.data!['email']} "),
                            Text("Telefon: ${snapshot.data!['telefon']} "),
                          ],
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.none) {
                      return const Text("No data");
                    }
                    return const CircularProgressIndicator();
                  }),
              const SizedBox(
                height: 2,
              ),
              FutureBuilder(
                  future: getCameraDocument(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        color: const Color.fromARGB(255, 147, 179, 206),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text("Camera: ${snapshot.data!['numarCamera']} "),
                          ],
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.none) {
                      return const Text("No data");
                    }
                    return const CircularProgressIndicator();
                  }),
              Container(
                color: const Color.fromARGB(255, 101, 154, 197),
                width: double.infinity,
                child: Column(
                  children: [
                    Text("Stare rezervare:  $stareRezervare"),
                    Text(
                        "Data Sosire:  ${DateFormat.yMEd().format(dataSosire).toString()}"),
                    Text(
                        "Data Plecare:  ${DateFormat.yMEd().format(dataPlecare).toString()}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
