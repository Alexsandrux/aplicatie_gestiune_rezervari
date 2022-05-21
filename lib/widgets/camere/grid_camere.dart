import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/rezervare.dart';
import '../../models/camera.dart';
import './camera_grid_tile.dart';

import '../../providers/rezervari_provider.dart';
import '../../providers/camere_provider.dart';

class GridCamere extends StatefulWidget {
  final DateTime dataSosire;
  final DateTime dataPlecare;

  const GridCamere({
    required this.dataSosire,
    required this.dataPlecare,
    Key? key,
  }) : super(key: key);

  @override
  State<GridCamere> createState() => _GridCamereState();
}

class _GridCamereState extends State<GridCamere> {
  late List<Rezervare> rezervari;
  late List<Camera> camere;

  List<Camera> get getCamereVerificate {
    return camere.where((camera) {
      if (rezervari.isEmpty) {
        return true;
      } else {
        for (var rezervare in rezervari) {
          if (rezervare.idCamera.compareTo(camera.idCamera) == 0) {
            if (widget.dataSosire.isAfter(rezervare.dataPlecare)) {
              continue;
            }

            if (widget.dataPlecare.isBefore(rezervare.dataSosire)) {
              continue;
            }

            if (widget.dataSosire.isAfter(rezervare.dataSosire) ||
                rezervare.dataSosire.isAtSameMomentAs(widget.dataSosire)) {
              if (widget.dataPlecare.isBefore(rezervare.dataPlecare) ||
                  rezervare.dataPlecare.isAtSameMomentAs(widget.dataPlecare)) {
                return false;
              }
            }

            if ((widget.dataSosire.isAfter(rezervare.dataSosire) ||
                    rezervare.dataSosire.isAtSameMomentAs(widget.dataSosire)) &&
                widget.dataPlecare.isAfter(rezervare.dataPlecare)) {
              return false;
            }

            if (widget.dataSosire.isBefore(rezervare.dataSosire) &&
                    widget.dataPlecare.isBefore(rezervare.dataPlecare) ||
                rezervare.dataPlecare.isAtSameMomentAs(widget.dataPlecare)) {
              return false;
            }

            if (widget.dataSosire.isBefore(rezervare.dataSosire) &&
                widget.dataPlecare.isAfter(rezervare.dataPlecare)) {
              return false;
            }
          }
        }
        return true;
      }
    }).toList();
  }

  late List<Camera> camereVerificate;

  @override
  Widget build(BuildContext context) {
    final rezervariData = Provider.of<RezervariProvider>(context);
    rezervari = rezervariData.getItems;
    final camereData = Provider.of<CamereProvider>(context);
    camere = camereData.getItems;

    camereVerificate = getCamereVerificate;

    return camereVerificate.isNotEmpty
        ? GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 4 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
            ),
            itemCount: camereVerificate.length,
            itemBuilder: (BuildContext ctx, index) {
              return CameraGridTile(
                dataSosire: widget.dataSosire,
                dataPlecare: widget.dataPlecare,
                camera: camereVerificate[index],
              );
            })
        : const Text("Nu există camere disponible in această perioadă!");
  }
}
