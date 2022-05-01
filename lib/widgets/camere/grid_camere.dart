import 'package:flutter/material.dart';

import '../../DUMMY_DATA.dart';

import '../../models/camera.dart';
import './camera_grid_tile.dart';

class GridCamere extends StatefulWidget {
  DateTime dataSosire;
  DateTime dataPlecare;

  GridCamere({
    required this.dataSosire,
    required this.dataPlecare,
    Key? key,
  }) : super(key: key);

  @override
  State<GridCamere> createState() => _GridCamereState();
}

class _GridCamereState extends State<GridCamere> {
  List<Camera> get getCamereVerificate {
    return camere.where((camera) {
      if (rezervari.isEmpty) {
        return true;
      } else {
        for (var rezervare in rezervari) {
          if (rezervare.idCamera.compareTo(camera.idCamera) == 0) {
            print("DATA SOSIRE " +
                widget.dataSosire.toString() +
                " / " +
                rezervare.dataSosire.toString());

            print("DATA PLECARE " +
                widget.dataPlecare.toString() +
                " / " +
                rezervare.dataPlecare.toString());
            if (widget.dataSosire.isAfter(rezervare.dataSosire) ||
                rezervare.dataSosire.isAtSameMomentAs(widget.dataSosire)) {
              print("ESTE!");
              if (widget.dataPlecare.isBefore(rezervare.dataPlecare) ||
                  rezervare.dataPlecare.isAtSameMomentAs(widget.dataPlecare)) {
                print("ESTE2222223!");
                return false;
              }
            }

            if (widget.dataSosire.isBefore(rezervare.dataPlecare)) {
              print("ESTE2222223!");
              return false;
            }
          }
        }
        return true;
      }
    }).toList(); // provider de rezervari si camere neaparat!!!!
  }

  late List<Camera> camereVerificate;

  @override
  Widget build(BuildContext context) {
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
