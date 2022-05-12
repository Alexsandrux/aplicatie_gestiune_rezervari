import 'package:flutter/material.dart';

import '../../models/camera.dart';
import '../../screens/camera_screen.dart';

class CameraGridTile extends StatefulWidget {
  final Camera camera;

  final DateTime? dataSosire;
  final DateTime? dataPlecare;

  final Function reincarcaPagina;

  const CameraGridTile({
    required this.reincarcaPagina,
    required this.dataSosire,
    required this.dataPlecare,
    required this.camera,
    Key? key,
  }) : super(key: key);

  @override
  State<CameraGridTile> createState() => _CameraGridTileState();
}

class _CameraGridTileState extends State<CameraGridTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CameraScreen.routeName, arguments: [
          widget.camera,
          widget.dataSosire,
          widget.dataPlecare
        ]).then((value) => widget.reincarcaPagina());
      },
      splashColor: Theme.of(context).highlightColor,
      borderRadius: BorderRadius.circular(10),
      child: Card(
        elevation: 15,
        color: Colors.purple[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Text("  Camera ${widget.camera.numarCamera}"),
              padding: const EdgeInsets.only(top: 5),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text("  Etaj ${widget.camera.etaj}"),
              color: Theme.of(context).primaryColorDark,
            ),
            Container(
              child: Text("  ${widget.camera.numarLocuriCamera} persoane"),
              padding: const EdgeInsets.only(bottom: 5),
            ),
          ],
        ),
      ),
    );
  }
}
