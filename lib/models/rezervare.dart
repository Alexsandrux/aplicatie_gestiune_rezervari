class Rezervare {
  final String idRezervare;
  final String idCamera;
  final DateTime dataSosire;
  final DateTime dataPlecare;
  final DateTime dataInregistrareRezervare;

  Rezervare({
    required this.idRezervare,
    required this.idCamera,
    required this.dataSosire,
    required this.dataPlecare,
    required this.dataInregistrareRezervare,
  });

  @override
  String toString() {
    return "id: $idRezervare, idCamera: $idCamera, dataSosire: $dataSosire, dataPlecare: $dataPlecare, DataInregistrare: $dataInregistrareRezervare";
  }
}
