class Camera {
  final String idCamera;
  final int numarCamera;
  final int numarLocuriCamera;
  final double pret;
  final String descriere;
  final String urlImagine;
  final int etaj;
  final bool areBalcon;

  const Camera({
    required this.idCamera,
    required this.numarCamera,
    required this.numarLocuriCamera,
    required this.pret,
    required this.descriere,
    required this.urlImagine,
    required this.etaj,
    required this.areBalcon,
  });
}
