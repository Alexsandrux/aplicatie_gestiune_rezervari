import 'package:flutter/material.dart';

import '../models/camera.dart';

class CamereProvider with ChangeNotifier {
  final List<Camera> _items = [
    const Camera(
      idCamera: "C1",
      numarCamera: 1,
      numarLocuriCamera: 2,
      pret: 200,
      descriere: "blank",
      urlImagine:
          "https://varfulromani.ro/wp-content/uploads/2021/12/vr-21-dec-2021-claudiu-bajan-logo-1080x675.jpg",
      etaj: 0,
      areBalcon: false,
    ),
    const Camera(
      idCamera: "C2",
      numarCamera: 2,
      numarLocuriCamera: 2,
      pret: 200,
      descriere:
          "Would you like to know how to create and design your own room? This article will explain the basics of room design, from concept to finished space.",
      urlImagine:
          "https://varfulromani.ro/wp-content/uploads/2021/12/vr-21-dec-2021-claudiu-bajan-logo-1080x675.jpg",
      etaj: 0,
      areBalcon: false,
    ),
    const Camera(
      idCamera: "C3",
      numarCamera: 3,
      numarLocuriCamera: 3,
      pret: 300,
      descriere:
          "Would you like to know how to create and design your own room? This article will explain the basics of room design, from concept to finished space.",
      urlImagine:
          "https://varfulromani.ro/wp-content/uploads/2021/12/vr-21-dec-2021-claudiu-bajan-logo-1080x675.jpg",
      etaj: 1,
      areBalcon: true,
    ),
    const Camera(
      idCamera: "C4",
      numarCamera: 4,
      numarLocuriCamera: 2,
      pret: 300,
      descriere:
          "Would you like to know how to create and design your own room? This article will explain the basics of room design, from concept to finished space.",
      urlImagine:
          "https://varfulromani.ro/wp-content/uploads/2021/12/vr-21-dec-2021-claudiu-bajan-logo-1080x675.jpg",
      etaj: 1,
      areBalcon: false,
    ),
    const Camera(
      idCamera: "C5",
      numarCamera: 5,
      numarLocuriCamera: 2,
      pret: 300,
      descriere:
          "Would you like to know how to create and design your own room? This article will explain the basics of room design, from concept to finished space.",
      urlImagine:
          "https://varfulromani.ro/wp-content/uploads/2021/12/vr-21-dec-2021-claudiu-bajan-logo-1080x675.jpg",
      etaj: 1,
      areBalcon: false,
    ),
  ];

  List<Camera> get getItems {
    return [..._items];
  }
}
