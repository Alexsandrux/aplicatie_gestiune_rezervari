import 'package:flutter/material.dart';
import './camera_information_tile.dart';

import '../../models/camera.dart';
import '../../models/rezervare.dart';

import '../../DUMMY_DATA.dart';

class CameraDetail extends StatelessWidget {
  final Camera camera;

  final DateTime dataSosire;
  final DateTime dataPlecare;

  void addRezervare(BuildContext context) {
    rezervari.add(
      Rezervare(
        idRezervare: "R" + rezervari.length.toString(),
        idCamera: camera.idCamera,
        dataSosire: dataSosire,
        dataPlecare: dataPlecare,
        dataInregistrareRezervare: DateTime.now(),
      ),
    );
    Navigator.of(context).pop();
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
            const Text(
              "Etc.",
              textScaleFactor: 10,
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: ElevatedButton(
                child: const Text("Rezervare"),
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
