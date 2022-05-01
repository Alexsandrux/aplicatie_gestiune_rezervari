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
      return !rezervari.any((rezervare) {
        // if ((rezervare.dataSosire.isAfter(widget.dataSosire) ||
        //         rezervare.dataSosire.isAtSameMomentAs(widget.dataSosire)) &&
        //     (rezervare.dataPlecare.isBefore(widget.dataPlecare) ||
        //         rezervare.dataPlecare.isAtSameMomentAs(widget.dataPlecare))) {
        //   return rezervare.idCamera == camera.idCamera;
        // } else {
        //   return false;
        // }

        if (widget.dataSosire.isAfter(rezervare.dataSosire)) {
          print(camera.idCamera +
              " este dupa data stabilita " +
              rezervare.dataSosire.toString() +
              " / " +
              widget.dataSosire.toString());
          return rezervare.idCamera == camera.idCamera;
        } else if (widget.dataSosire.isAtSameMomentAs(rezervare.dataSosire)) {
          print(camera.idCamera +
              " este in acelasi moment ca stabilita " +
              rezervare.dataSosire.toString() +
              " / " +
              widget.dataSosire.toString());
          return rezervare.idCamera == camera.idCamera;
        }
        print(camera.idCamera +
            " niciuna " +
            rezervare.dataSosire.toString() +
            " / " +
            widget.dataSosire.toString());
        return false;
      });
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
