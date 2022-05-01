import 'package:flutter/material.dart';

import '../models/camera.dart';

class CamereProvider with ChangeNotifier {
  List<Camera> _items = [];

  List<Camera> get getItems {
    return [..._items];
  }
}
