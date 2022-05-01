import 'package:flutter/material.dart';

import '../../models/camera.dart';
import '../../screens/camera_screen.dart';

class CameraGridTile extends StatelessWidget {
  final Camera camera;

  final DateTime? dataSosire;
  final DateTime? dataPlecare;

  const CameraGridTile({
    required this.dataSosire,
    required this.dataPlecare,
    required this.camera,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CameraScreen.routeName,
            arguments: [camera, dataSosire, dataPlecare]);
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
              child: Text("  Camera ${camera.numarCamera}"),
              padding: const EdgeInsets.only(top: 5),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text("  Etaj ${camera.etaj}"),
              color: Theme.of(context).primaryColorDark,
            ),
            Container(
              child: Text("  ${camera.numarLocuriCamera} persoane"),
              padding: const EdgeInsets.only(bottom: 5),
            ),
          ],
        ),
      ),
    );
  }
}
