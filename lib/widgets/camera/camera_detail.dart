import 'package:flutter/material.dart';
import './camera_information_tile.dart';

import '../../models/camera.dart';
import '../../models/rezervare.dart';

import '../../providers/rezervari_provider.dart';

import 'package:provider/provider.dart';

class CameraDetail extends StatelessWidget {
  final Camera camera;

  final DateTime dataSosire;
  final DateTime dataPlecare;

  void addRezervare(BuildContext context) {
    final rezervariData =
        Provider.of<RezervariProvider>(context, listen: false);
    final rezervareNoua = Rezervare(
      idRezervare: "R${rezervariData.getItems.length}",
      idCamera: camera.idCamera,
      dataSosire: dataSosire,
      dataPlecare: dataPlecare,
      dataInregistrareRezervare: DateTime.now(),
    );
    rezervariData.addItem(rezervareNoua);
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
                child: const Text("Rezervă"),
                onPressed: () {
                  //TODO: de finalizat alertDialog
                  /*showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Doriți să finalizați rezervarea?"),
                      content: Column(
                        children: const [
                          Text(
                              "Sunteți sigur ca vreți să sa rezervați camera?"),
                          Text(
                              "Vor exista cheltuieli ulterioare legate de plata avansului!"),
                        ],
                      ),
                    ), // de verificat daca este sigur ca utilizatorul este sigur ca vrea sa faca rezervare si sa fie atentionat in legatura cu plata ulterioara a avansului
                  ).then(
                    ((value) => addRezervare(context)),
                  ); */
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
