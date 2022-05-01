import 'package:flutter/material.dart';

import '../models/camera.dart';
import '../widgets/camera/camera_detail.dart';

class CameraScreen extends StatelessWidget {
  static const String routeName = "/camera";

  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List arguments = ModalRoute.of(context)?.settings.arguments as List;
    final camera = arguments[0] as Camera;
    final DateTime dataSosire = arguments[1] as DateTime;
    final DateTime dataPlecare = arguments[2] as DateTime;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text("Camera ${camera.numarCamera}"),
      ),
      body: Center(
        child: CameraDetail(
          dataSosire: dataSosire,
          dataPlecare: dataPlecare,
          camera: camera,
        ),
      ),
    );
  }
}
