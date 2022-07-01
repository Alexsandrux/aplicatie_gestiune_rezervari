import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/convertor_stare_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../providers/rezervari_user_provider.dart';
import './camera_information_tile.dart';

import '../../models/camera.dart';
import '../../models/rezervare.dart';

import '../../providers/rezervari_provider.dart';

import 'package:provider/provider.dart';

class CameraDetail extends StatelessWidget {
  final Camera camera;

  final DateTime dataSosire;
  final DateTime dataPlecare;

  void addRezervare(BuildContext context) async {
    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.of(context).pop();
    }
    final rezervariData =
        Provider.of<RezervariProvider>(context, listen: false);
    final rezervariUserData =
        Provider.of<RezervariUserProvider>(context, listen: false);
    final rezervareNoua = Rezervare(
      idCamera: camera.idCamera,
      dataSosire: dataSosire,
      dataPlecare: dataPlecare,
      dataInregistrareRezervare: DateTime.now(),
      idUtilizator: FirebaseAuth.instance.currentUser!.uid,
    );
    await FirebaseFirestore.instance.collection("rezervari").add({
      "idCamera": rezervareNoua.idCamera,
      "dataSosire": rezervareNoua.dataSosire,
      "dataPlecare": rezervareNoua.dataPlecare,
      "dataInregistrareRezervare": rezervareNoua.dataInregistrareRezervare,
      "idUtilizator": rezervareNoua.idUtilizator,
      "stare":
          ConvertorStareInText().transformaStareaInText(rezervareNoua.getStare)
    }).then(
      (value) {
        rezervareNoua.idRezervare = value.id;
        rezervariData.addItem(rezervareNoua);
        rezervariUserData.addItem(rezervareNoua);
      },
      onError: (e) {
        if (kDebugMode) {
          print(e);
        }
      },
    );
    Navigator.of(context).pop(true);
  }

  const CameraDetail(
      {required this.dataSosire,
      required this.dataPlecare,
      required this.camera,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            SizedBox(
              width: double
                  .infinity, // trebuie luate in functie de dimensiunea telefonului
              height: 200,
              child: Image.network(
                camera.urlImagine,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CameraInformationTile(
                subtitle: camera.numarLocuriCamera > 2
                    ? "Apartament"
                    : "Camera Dubla",
                description:
                    "Această cameră poate fi ocupată de ${camera.numarLocuriCamera} adulți/copii"),
            CameraInformationTile(
              subtitle: "Etaj",
              description: camera.etaj == 0 ? "Parter" : camera.etaj.toString(),
            ),
            CameraInformationTile(
              subtitle: "Balcon",
              description: camera.areBalcon
                  ? "Camera are balcon"
                  : "Camera nu are balcon",
            ),
            CameraInformationTile(
              subtitle: "Pret",
              description: "${camera.pret} lei",
            ),
            CameraInformationTile(
              subtitle: "Descriere",
              description: camera.descriere,
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: ElevatedButton(
                child: const Text("Rezervă"),
                onPressed: () {
                  addRezervare(context);
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                      const Size.fromWidth(200)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
